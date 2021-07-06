class Task < ApplicationRecord
  validates :content,  length: { in: 1..140 }
  validates :content, presence: true
  validates :name, presence: true
  def self.search(keyword)
    where(["name like? OR content  like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
