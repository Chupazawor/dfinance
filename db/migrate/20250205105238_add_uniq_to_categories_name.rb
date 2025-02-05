class AddUniqToCategoriesName < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, [:name, :user_id], unique: true
  end
end
