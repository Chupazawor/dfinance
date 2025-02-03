class Category < ApplicationRecord
  validates_presence_of :user_id unless :general
  validates_presence_of :name, allow_blank: false 
end
