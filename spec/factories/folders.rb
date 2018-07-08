# frozen_string_literal: true

FactoryGirl.define do
  factory :folder do
    uid SecureRandom.urlsafe_base64
    title Faker::App.name
  end
end
