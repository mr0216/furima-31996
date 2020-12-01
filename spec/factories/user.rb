FactoryBot.define do
  factory :user do
    nickname              {"tanaka"}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    password_confirmation {password}
    last_name             {"全角"}
    first_name            {"全角"}
    last_name_kana        {"ゼンカクカナ"}
    first_name_kana       {"ゼンカクカナ"}
    birthday              {"1990-01-01"}
  end
end