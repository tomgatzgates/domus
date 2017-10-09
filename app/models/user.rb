class User < ApplicationRecord
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  validates :email, presence: true,
                    uniqueness: { case_senstive: false },
                    format: { with: EMAIL_REGEX }
  validates :token, uniqueness: true, allow_nil: true

  def email=(value)
    self[:email] = value.downcase.delete(' ')
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    update(token: token, token_generated_at: Time.now.utc)
    token
  end
end
