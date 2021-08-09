class User < ApplicationRecord
    before_save { self.email = email.downcase } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,format: { with: VALID_EMAIL_REGEX}
    validates :name, presence: true
    has_secure_password
    validates :password, presence: true
end
 