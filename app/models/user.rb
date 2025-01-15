class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, length: { maximum: 50 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_many :expenses
end
