# README
DFinance - An app for easy management of your finances.

## Prerequisites
The setups steps expect following tools installed on the system:
* Ruby 3.3.5
* Rails 8.0.1
* Postgresql 14.13

## Installation
1. Check out the repository
`git clone git@github.com:Chupazawor/dfinance.git`
2. Run
`$ bundle install`
3. Create and setup the database:
`rails db:setup`
4. Create default categories in database:
`rails categories:default_category`

## Running
Start the Rails server `$ rails s`
Visit: http://127.0.0.1:3000/

## Testing
We're using RSpec: run `$ rspec`

## Linters
Rubocop: `$ rubocop`
Reek: `$ reek`
