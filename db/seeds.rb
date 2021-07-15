# User.create!(name:  "管理者",
#              email: "admin@gmail.com",
#              password:  "111111",
#              password_confirmation: "111111",
#              admin: true)
Label.create!([{ name: 'No1' },
             { name: 'No2' },
             { name: 'No3'},
             { name: 'No4'},
             { name: 'No5'},
             { name: 'No6'},
             { name: 'No7'},
             { name: 'No8'},
             { name: 'No9'},
             { name: 'No10'}
             ])
User.create(
            name: "sample",
            email: "sample@example.com",
            password: "password",
            admin: true
            )


        i = 1
        10.times do
        name = ('a'..'z').to_a.shuffle[1..5].join
        User.create(
         name: name,
         email: "#{i}@aaaaaaaaa.com",
         password: "password",
         admin: false
        )
        i += 1
        end


  10.times do
  i = 1
  d1 = Date.parse("2021/04/13")
  d2 = Date.parse("2021/08/30")
  date = Random.rand(d1..d2)
  name = ('a'..'z').to_a.shuffle[1..11].join
  content = ('A'..'Z').to_a.shuffle[1..15].join
  status = Random.rand(0..2)
  priority = Random.rand(0..2)
  user_id = Random.rand(1..8)
  Task.create(
   name: name,
   content: content,
   deadline:  date,
   status: status,
   priority: priority,
   user_id: user_id
  )
  i += 1
  end

task_id = 1
10.times do
label_id = Random.rand(1..9)
Labelling.create(
 task_id: task_id,
 label_id: label_id
)
task_id += 1
end
