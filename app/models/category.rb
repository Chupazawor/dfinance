class Category < ApplicationRecord
  validates_presence_of :user_id unless :general
end
