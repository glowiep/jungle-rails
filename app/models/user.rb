class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 7..20 }
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = find_by_email(email)
    user if user&.authenticate(password)
  end
end  

