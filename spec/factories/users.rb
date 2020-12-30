FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"A12345"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"一郎"}
    last_name_k           {"タナカ"}
    first_name_k          {"イチロウ"}
    birthday              {"1998-08-01"}
  end
end