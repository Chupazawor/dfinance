class Expense < ApplicationRecord
  validates :date, format: { with: MM/DD/YYYY } # по аналогии с email делал.

  belongs_to :user
end
