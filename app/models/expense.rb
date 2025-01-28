class Expense < ApplicationRecord
  #validates_format_of :date, with: /\d{2}\/\d{2}\/\d{4}/

  belongs_to :user
  belongs_to :category

  validates_presence_of :amount, :date, :category
end
