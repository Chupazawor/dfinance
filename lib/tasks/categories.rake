require 'yaml'

namespace :categories do
  desc 'Populate default categories'
  task default_category: :environment do
    Rails.logger.info('Running pupulate categories')
    categories = YAML.load_file('lib/tasks/default_categories_ru.yml').fetch('default_categories')

    categories.each do |category_name|
      Category.create(name: category_name, general: true)
    end
  end
end
