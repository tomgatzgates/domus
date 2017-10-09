class User < ApplicationRecord
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_many :properties

  validates :email, presence: true,
                    uniqueness: { case_senstive: false },
                    format: { with: EMAIL_REGEX }
  validates :token, uniqueness: true, allow_nil: true

  def email=(value)
    self[:email] = value.downcase.delete(' ')
  end

  def generate_token
    update(token: SecureRandom.urlsafe_base64, token_expires_at: Time.now.utc + 30.minutes)
    token
  end

  def expire_token!
    update!(token: nil, token_expires_at: nil)
  end
end
