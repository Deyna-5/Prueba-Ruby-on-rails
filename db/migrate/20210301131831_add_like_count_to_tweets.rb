class AddLikeCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :like_count, :integer
    add_column :tweets, :retweets_count, :integer
    add_column :tweets, :retweets_from, :integer
  end
end
