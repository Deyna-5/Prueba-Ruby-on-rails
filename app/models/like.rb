class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  #def cont_likes
  #  self.likes.size
  #end
end
