class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :sanitize_email
  before_create :generate_tokens

  scope :verified, -> { where(verified: true) }
  scope :currently_subscribed, -> { where(verified: true, unsubscribed: false) }

  def sanitize_email
    self.email = self.email.strip 
  end

  def generate_tokens
    begin
      self.verification_token = SecureRandom.hex 32
    end while Subscriber.where(verification_token: self.verification_token).exists?

    begin
      self.unsubscription_token = SecureRandom.hex 32
    end while Subscriber.where(unsubscription_token: self.unsubscription_token).exists?
  end
end
