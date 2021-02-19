class Tweet < ApplicationRecord
       belongs_to :user
       has_many :likes, dependent: :destroy

       validates :content, presence: true

       scope :last_50_tweets, -> { self.all.order(created_at: :desc).limit(50) }
       scope :order_desc, -> {self.all.order(created_at: :desc)}

end
