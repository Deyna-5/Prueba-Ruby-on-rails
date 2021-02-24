class FriendsController < ApplicationController

       def friends
              @friend = set_friend

              if @friend.nil?

                     @friend = Friend.new

                     @friend.user = current_user
                     
                     @friend.friend_id = params[:friend_id]

                     if @friend.save!
                            redirect_to root_path, notice: "Empezaste a seguir un nuevo usuario"
                     end

              else
                     @friend.destroy
                     redirect_to root_path, alert: "Dejaste de seguir a un usuario"
              end
       end
       

       private
              def set_friend
                     @friend = Friend.find_by(friend_id: params[:friend_id], user_id: current_user.id)
              end

end