class Tweet < ApplicationRecord
       belongs_to :user
       has_many :likes, dependent: :destroy
       has_many :tweet

       validates :content, presence: true

       scope :last_50_tweets, -> { self.all.order(created_at: :desc).limit(50) }

end
