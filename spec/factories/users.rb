FactoryBot.define do
  factory :user do

    name { "MyString" }
    email { "email@example.com" }
    password { "12345678" }
  end

  factory :user1 do

    name { "sivan" }
    email { "sivan@example.com" }
    password { "12345678" }
  end
end
