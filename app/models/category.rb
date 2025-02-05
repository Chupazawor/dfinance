class Category < ApplicationRecord
  validates_presence_of :user_id unless :general
  validates_presence_of :name, allow_blank: false 

  scope :general, -> { where(general: true)}
  scope :custom_for, -> (user_id) { where(general: false, user_id: user_id) }
  scope :for, -> (user_id) { general.or(custom_for(user_id)) }
end
