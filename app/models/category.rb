# frozen_string_literal: true

class Category < ApplicationRecord
  validates :user_id, presence: true if :general? # rubocop:disable Lint/LiteralAsCondition
  validates :name, presence: { allow_blank: false }

  scope :only_general, -> { where(general: true) }
  scope :custom_for, ->(user_id) { where(general: false, user_id: user_id) }
  scope :for, ->(user_id) { only_general.or(custom_for(user_id)) }
end
