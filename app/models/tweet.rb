class Tweet < ApplicationRecord
       belongs_to :users
       has_many :likes
       scope :last_50_tweets, -> { self.all.order(created_at: :desc).limit(50) }
end
