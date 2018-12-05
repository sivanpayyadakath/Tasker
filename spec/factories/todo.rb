FactoryBot.define do
  factory :todo do
    title { Faker::Commerce.product_name }
    deadline_at { Faker::Date.forward}
    user_id { "1"}
  end

  factory :invalid_todo do
    title { nil }
  end
end