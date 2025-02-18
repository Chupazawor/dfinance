# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[8.0]
  def up
    create_table :categories do |t|
      t.timestamps
      t.string :name, null: false
      t.boolean :general, default: false
      t.references :user
    end
  end

  def down
    drop_table :categories
  end
end
