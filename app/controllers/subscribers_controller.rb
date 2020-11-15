class SubscribersController < ApplicationController
  def index
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new subscriber_params

    if @subscriber.save
      SubscriberMailer.with(email: @subscriber.email, token: @subscriber.verification_token).verify.deliver_later
      redirect_to root_url, notice: "We've saved your email."
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
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
