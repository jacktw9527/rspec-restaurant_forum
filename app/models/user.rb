class User < ApplicationRecord
  
  # 如果 User 有了評論，就不允許刪除帳號（刪除時拋出 Error） 
  has_many :comments, dependent: :restrict_with_error
  
  has_many :restaurants, through: :comments
  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  #使用者可以「喜歡」很多餐廳
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  #User可以有很多followships與followings
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.role == "admin"
  end

end
