FactoryBot.define do
  factory :todo do
    title { Faker::Commerce.product_name }
  end

  factory :invalid_todo do
    title { nil }
  end
end