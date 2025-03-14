# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { 'test@gmail.com' }
  end
end
