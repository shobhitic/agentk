class SubscribersController < ApplicationController
  def index
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    if subscriber = Subscriber.where("lower(email) = lower('#{subscriber_params[:email]}')").first

      if subscriber.verified? && subscriber.subscribed?
        redirect_to root_url, notice: "You're already on the list."

        return
      end

      subscriber.generate_tokens
      subscriber.unsubscribed = false
      subscriber.verified = false
      SubscriberMailer.with(email: subscriber.email, token: subscriber.verification_token).verify.deliver_later
      if subscriber.save
        redirect_to root_url, notice: "Please verify your email address by clicking on the link we've sent you in the mail."
      else
        redirect_to root_url, alert: "We were not able to save your email."
      end

      return
    end

    @subscriber = Subscriber.new subscriber_params

    if @subscriber.save
      SubscriberMailer.with(email: @subscriber.email, token: @subscriber.verification_token).verify.deliver_later
      redirect_to root_url, notice: "Please verify your email address by clicking on the link we've sent you in the mail."
    else
      redirect_to root_url, alert: "We were not able to save your email."
    end
  end

  def verify
    token = params[:token]
    email = params[:email]
    subscriber = Subscriber.find_by_verification_token! token
    if subscriber.email.downcase == email.downcase.strip
      subscriber.update verified: true
    else
      render plain: "Couldn't verify your email."
    end
  end

  def unsubscribe
    token = params[:token]
    email = params[:email]
    subscriber = Subscriber.find_by_unsubscription_token! token
    if subscriber.email.downcase == email.downcase.strip
      subscriber.update unsubscribed: true
    else
      render plain: "Couldn't unsubscribe your email."
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
