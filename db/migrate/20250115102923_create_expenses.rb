class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.timestamps
      t.integer :sum, null: false, limit: 6
      t.date :date, null: false
      t.string :category, null: false, limit: 20
    end
  end
end
