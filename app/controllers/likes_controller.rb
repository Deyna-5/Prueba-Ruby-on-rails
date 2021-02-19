class LikesController < ApplicationController
       skip_before_action :verify_authenticity_token
       before_action :find_tweet
       before_action :find_like, only: [:destroy]

       def create
              if alredy_liked?
                     flash[:notice] = "No puedes volver a dar like"
              else
                     @tweet.likes.create(user_id: current_user.id)
                     redirect_to root_path(@tweet)
              end
       end

       def destroy
              if ! (alredy_liked?)
                     flash[:notice] = "Like removido"
              else
                     @like.destroy
              end
              redirect_to root_path(@tweet)
       end

       private
              def find_tweet
                     @tweet = Tweet.find(params[:tweet_id])
              end

              def find_like
                     @like = @tweet.likes.find(params[:id])
              end

              def alredy_liked?
                     Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).exists?
              end
end

