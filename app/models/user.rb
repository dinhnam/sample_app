class User < ApplicationRecord
  before_save{self.email = email.downcase}
  validates :name,  presence: true, length: {maximum:
    Settings.validates.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:
    Settings.validates.max_email},
      format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum:
    Settings.validates.min_password}
end
