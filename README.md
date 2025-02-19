# README
DFinance - An app for easy management of your finances.

Prerequisites
The setups steps expect following tools installed on the system.
  * Github
  * Ruby 3.3.5
  * Rails 8.0.1
  * Postgresql 14.13 (Homebrew)

Installation
1. Check out the repository.
    git@github.com:Chupazawor/dfinance.git
    Run bundle.

2. Create and setup the database.
    Run the following commands to setup the database.
    bundle exec rake db:setup

3. Create default categories in database.
    Run the following command to create default categories.
    bundle exec rake categories:default_category

Running
4. Start the Rails server.
    bundle exec rails s
    Link in browser: http://127.0.0.1:3000/expenses

Tests
5. Test suite: Rspec
    How to run the test suite: bundle exec rspec

Linters
6. Linter: Rubopoc
    How to run rubocop: bundle exec rubocop
