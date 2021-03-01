class AddLikeCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :likes_count, :integer
    add_column :tweets, :retweets_count, :integer
    add_column :tweets, :rewtitted_from, :integer
  end
end
