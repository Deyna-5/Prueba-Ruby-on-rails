class Tweet < ApplicationRecord
       belongs_to :user
       has_many :likes, dependent: :destroy
       has_many :retweets

       validates :content, presence: true

       scope :last_50_tweets, -> { self.all.order(created_at: :desc).limit(50) }
       #scope :tweets_for_me, -> {self.all.where(friend_id: current_user.friend_id)}
end
