class Friend < ApplicationRecord
  belongs_to :friend_id
  belongs_to :user_id
end
