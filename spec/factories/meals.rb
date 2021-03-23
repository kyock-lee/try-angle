FactoryBot.define do
  factory :meal do
    date                                     { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
    description                              { '食事内容の説明です' }
    association :user 
  end
end
