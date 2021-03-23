FactoryBot.define do
  factory :weight do
      weight                                   { 80 }
      date                                     { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
      association :user 
  end
end
