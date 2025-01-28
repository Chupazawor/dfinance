namespace :categories do
  desc "default category"
  task default_category: :environment do
    puts 'Test cat'
  end
end