# frozen_string_literal: true

class AddUniqToCategoriesName < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, %i[name user_id], unique: true
  end
end
