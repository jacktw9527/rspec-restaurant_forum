class Category < ApplicationRecord
  # Category 下有餐廳物件就不允許刪除（刪除時拋出 Error）
  has_many :restaurants, dependent: :restrict_with_error

  validates_presence_of :name
  validates_uniqueness_of :name
end
