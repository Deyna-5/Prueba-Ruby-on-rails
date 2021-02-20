class TweetsController < ApplicationController
       before_action :authenticate_user!, :except => [:index]
       before_action :set_tweet, only: [:show, :retweet]

       def index
              @tweets = Tweet.order(created_at: :desc).page(params[:pages]).per(50)
              if user_signed_in?
                     @tweets = Tweet.all.order_desc
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

       def show
       end

       private
              def tweets_params
                     params.permit(:content)
              end

              def set_tweet
                     @tweet = Tweet.find(params[:id])
              end
end