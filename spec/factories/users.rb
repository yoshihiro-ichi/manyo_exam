FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@a.com" }
    password {"111111"}
    admin {"false"}
  end
  factory :second_user , class: User do
    name {"セカンドテストユーザー"}
    email {"secondtest@a.com"}
    password {"111111"}
    admin {"ture"}
  end


end
