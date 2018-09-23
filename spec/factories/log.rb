FactoryBot.define do
  factory :log, class: TinyLog::Log do
    uid { SecureRandom.urlsafe_base64 }
    file { FactoryBot.create(:file) }
    text { Faker::Lorem.paragraph }
    log_type { TinyLog::Log.log_types.to_a.shuffle.first[0].to_sym }
  end
end
