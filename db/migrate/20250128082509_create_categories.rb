class CreateCategories < ActiveRecord::Migration[8.0]
  require 'rake'
  DFinance::Application.load_tasks
  
  def change
    create_table :categories do |t|
      t.timestamps
      t.string :name, null: false
      t.boolean :general, default: false
      t.references :user
    end
    Rake::Task['categories:default_category'].invoke
  end
end
