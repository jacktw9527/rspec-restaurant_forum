class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates_presence_of :name
  mount_uploader :image, PhotoUploader
end
