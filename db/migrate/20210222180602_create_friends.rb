class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :friends, :follower_id
    add_index :friends, :followed_id
  end
end
