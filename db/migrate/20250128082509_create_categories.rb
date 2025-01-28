require 'rake'
Dfinance::Application.load_tasks

class CreateCategories < ActiveRecord::Migration[8.0]
  def up
    create_table :categories do |t|
      t.timestamps
      t.string :name, null: false
      t.boolean :general, default: false
      t.references :user
    end

    Rake::Task['categories:default_category'].invoke
  end

  def down
    drop_table :categories
  end
end
