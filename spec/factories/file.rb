FactoryBot.define do
  factory :file, class: TinyLog::File do
    uid { SecureRandom.urlsafe_base64 }
    name { Faker::App.name }
  end
end
  