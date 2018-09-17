class Restaurant < ApplicationRecord
  belongs_to :category
  
  #當 Restaurant 物件被刪除，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  #餐廳可以被許多使用者收藏的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites,  source: :user

  validates_presence_of :name
  mount_uploader :image, PhotoUploader


  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  
end
