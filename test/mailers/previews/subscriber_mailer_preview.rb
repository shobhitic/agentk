# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/verify
  def verify
    s = Subscriber.last
    SubscriberMailer.with(email: s.email, token: s.verification_token).verify
  end

end
