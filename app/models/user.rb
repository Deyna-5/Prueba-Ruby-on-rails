class User < ApplicationRecord
  has_many :tweets
  has_many :likes
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_friends, class_name: "Friend", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friends, class_name: "Friend", foreign_key: "followed_id"
  has_many :following, through: :active_friends, source: :followed
  has_many :followers, through: :passive_friends, source: :follower

  def follow(user)
    active_friends.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friends.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

end
