# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
    user_id { '1' }

    trait :general do
      general { true }
    end
  end
end
