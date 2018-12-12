FactoryBot.define do
  factory :todo do
    title { Faker::Commerce.product_name }
    deadline_at { Faker::Date.forward}
    user_id { '1' }
    user { :user }
  end

  factory :todo2 do
    title { Faker::Commerce.product_name }
    deadline_at { Faker::Date.forward}
    user_id { '1' }
    user { :user }
  end

end