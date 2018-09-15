class Restaurant < ApplicationRecord
  belongs_to :category
  
  #當 Restaurant 物件被刪除，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy
  
  has_many :users, through: :comments

  validates_presence_of :name
  mount_uploader :image, PhotoUploader
end
