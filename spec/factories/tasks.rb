FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    name { 'test_name' }
    content { 'test_content' }
    deadline {'2021-07-01 00:00:00'}
    status {'未着手'}
    priority{'高'}
  end

  factory :scond_task, class: Task do
    name { 'second_test_name' }
    content { 'second_test_content' }
    deadline {'2021-07-02 00:00:00'}
    status {'着手'}
    priority {'低'}
  end
end
