namespace :db do
  desc "Make development database"
  task make: :environment do
    return "This task no run in production environment" if Rails.env.production?

    puts "[1/3] Create database"
    `rails db:drop db:create`

    puts "[2/3] Run migrations"
    `rails db:migrate`

    puts "[3/3] Run seeds"
    `rails db:seed`
    puts "Done!"
  end
end
