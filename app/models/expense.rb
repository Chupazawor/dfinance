# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, :date, presence: true
end
