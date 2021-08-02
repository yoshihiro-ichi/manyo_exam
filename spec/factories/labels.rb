FactoryBot.define do
  factory :label do
     id { "0" }
     name { "Mr.children" }
  end

  factory :second_label, class: Label do
     id { "1" }
     name { "spitz" }
   end

  factory :third_label, class: Label do
     id { "2" }
     name { "polnograffitti" }
  end
end
