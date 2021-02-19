class TweetsController < ApplicationController
       def index
              @tweets = Tweet.order("created_at DESC")
              if current_user
                     @tweets = Tweet.all
              else
                     @tweets = Tweet.last_50_tweets
              end
       end

       def new
              @tweet = Tweet.new
       end

       def create
              @tweet = Tweet.new(tweets_params)
              @tweet.user_id = current_user.id if current_user

              if @tweet.save
                     redirect_to root_path, notice: "Tweet generado éxitosamente"
              else
                     render "new", alert: "Hubo un error, intente nuevamente"
              end
       end

       private
              def tweets_params
                     params.require(:tweet).permit(:content)
              end
end