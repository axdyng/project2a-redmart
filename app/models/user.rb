class User < ApplicationRecord
  before_save {self.email.downcase!}

  # VALIDATION
  VALID_EMAIL_REGEX = /\A[\w+\-]+@[a-z\d\-.]+\.[a-z]+\z/i
  # hashing password
  has_secure_password

  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :password,
            presence: true,
            length: { minimum: 4 },
            allow_nil: true

end
