class Task < ApplicationRecord
  validates :content,  length: { in: 1..140 }
  validates :content, presence: true
  validates :name, presence: true
  enum priority:{ 低:0, 中:1, 高:2 }

  # scope :name_status_search, ->(name,status) do
  #   where('name like ?',"%#{name}%").
  #     or where(status:status)

  # end
  scope :name_search , ->(name) do
    where('name like ?',"%#{name}%")
  end

  scope :status_search, ->(status) do
    where(status: status )
  end
end
