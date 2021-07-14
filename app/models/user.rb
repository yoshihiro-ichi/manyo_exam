class User < ApplicationRecord
  has_many :tasks ,dependent: :destroy
  validates :email, uniqueness: true
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  has_secure_password

  before_destroy :check_admin_destroy
  before_update :check_admin_update

  private
  def check_admin_update
    if changes.present?
  # binding.pry
      if changes[:admin]
        throw :abort if User.where(admin: true).count == 1 && self.admin == false
      end
    end
  end
  def check_admin_destroy
    throw :abort if User.where(admin: true).count == 1 && self.admin? == true
  end
end
