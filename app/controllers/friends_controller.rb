class FriendsController < ApplicationController
       before_action :authenticate_user!
       before_action :set_user

       def follow
              current_user.follow(@user)
              @follow = Follow.find_by(follower: current_user, followable: @user)
              redirect_to root_path, notice: "Haz empezado a segur a un nuevo usuario"
       end

       def unfollow
              current_user.stop_followin(@user)
              redirect_to root_path, notice: "Dejaste de seguir a un usuario"
       end

       private
              def set_user
                     @user = User.find(params[:id])
              end
end