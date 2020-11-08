class SubscribersController < ApplicationController
  def index
  end

  def new
  end

  def create
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
end
