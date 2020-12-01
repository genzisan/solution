FactoryBot.define do
  factory :tweet do
    category_id { 2 }
    text { 'テスト投稿' }
    association :user
  end
end