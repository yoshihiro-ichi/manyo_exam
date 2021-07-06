FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    name { 'test_name' }
    content { 'test_content' }
    deadline{'2021-07-01 00:00:00'}
    status{'未着手'}
  end
end
