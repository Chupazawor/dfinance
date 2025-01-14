class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :first_name, null: false, limit: 20
      t.string :last_name, null: false, limit: 20
      t.string :email, null: false, limit: 50
    end
  end
end
