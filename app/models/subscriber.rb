class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: { casesensitive: false }

  before_save :sanitize_email
  before_create :generate_verification_token

  def sanitize_email
    self.email = self.email.strip 
  end

  def generate_verification_token
    begin
      self.verification_token = SecureRandom.hex 32
    end while Subscriber.where(verification_token: self.verification_token).exists?
  end
end
