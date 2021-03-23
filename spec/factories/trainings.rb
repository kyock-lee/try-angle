FactoryBot.define do
  factory :training do
    date                                     { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
    description                              { 'トレーニング内容の説明です' }
    association :user 
  end
end
