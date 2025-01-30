class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :amount, :date, :category
end
