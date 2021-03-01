class Tweet < ApplicationRecord
       belongs_to :user
       has_many :likes, dependent: :destroy
       has_many :retweets
       has_many :friends

       validates :content, presence: true

       scope :last_50_tweets, -> { self.all.order(created_at: :desc).limit(50) }

end
