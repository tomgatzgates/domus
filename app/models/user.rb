class User < ApplicationRecord
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  validates :email, presence: true,
                    uniqueness: { case_senstive: false },
                    format: { with: EMAIL_REGEX }
  validates :token, uniqueness: true, allow_nil: true

  def email=(value)
    self[:email] = value.downcase.delete(' ')
  end
end
