# frozen_string_literal: true

class Category < ApplicationRecord
  validates :user_id, presence: true unless :general
  validates :name, presence: { allow_blank: false }

  scope :general, -> { where(general: true) }
  scope :custom_for, ->(user_id) { where(general: false, user_id: user_id) }
  scope :for, ->(user_id) { general.or(custom_for(user_id)) }
end
