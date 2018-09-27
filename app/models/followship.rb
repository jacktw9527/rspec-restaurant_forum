class Followship < ApplicationRecord
  validates :following_id, uniqueness: {scope: :user_id}


  belongs_to :user
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User", primary_key: :id, foreign_key: :following_id

end
