class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.timestamps
      t.integer :amount, null: false
      t.date :date, null: false
      t.string :category, null: false, limit: 20
      t.string :currency, default: 'BYN'
      t.references :user
    end
  end
end
