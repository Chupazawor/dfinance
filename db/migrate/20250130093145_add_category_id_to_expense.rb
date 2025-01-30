class AddCategoryIdToExpense < ActiveRecord::Migration[8.0]
  def up
    remove_column :expenses, :category

    change_table :expenses do |t|
      t.references :category
    end
  end

  def down
    remove_reference :expenses, :category
    add_column :expenses, :category, :string
  end
end
