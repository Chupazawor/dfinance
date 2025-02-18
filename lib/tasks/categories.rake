# frozen_string_literal: true

require 'yaml'

namespace :categories do
  desc 'Populate default categories'
  task default_category: :environment do
    Rails.logger.info('Running pupulate categories')
    categories = YAML.load_file('lib/tasks/default_categories_ru.yml').fetch('default_categories')

    categories.each do |category_name|
      Category.find_or_create_by(name: category_name, general: true)
    end
  end
end
