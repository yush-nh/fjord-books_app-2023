FactoryBot.define do
  factory :report do
    title { '日報テスト' }
    content { 'RSpecを勉強中〜' }
    created_at { 'Thu, 18 Apr 2024 09:02:19.322341000 JST +09:00' }

    association :user
  end
end
