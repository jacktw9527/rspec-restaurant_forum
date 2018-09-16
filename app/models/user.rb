class User < ApplicationRecord
  
  # 如果 User 有了評論，就不允許刪除帳號（刪除時拋出 Error） 
  has_many :comments, dependent: :restrict_with_error
  
  has_many :restaurants, through: :comments
  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.role == "admin"
  end

end
