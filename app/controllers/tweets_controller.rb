class TweetsController < ApplicationController
       before_action :authenticate_user!, :except => [:index]
       before_action :set_tweet, only: [:show, :retweet]

       def index
              if user_signed_in?
                      @tweets = Tweet.all.order(created_at: :DESC)
                     @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(50)
              else
                     @tweets = Tweet.last_50_tweets.page
                     @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(50)
              end
              @q =Tweet.ransack(params[:q])
              @tweets = @q.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(50)
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
                     redirect_to root_path, alert: "Hubo un error, intente nuevamente"
              end
       end

       def show
       end

       def retweet
              @retweet = Tweet.new(user_id: current_user.id, content: @tweet.content)

              if @retweet.save
                     redirect_to root_path, notice: "Retweet éxitoso"
              else
                     redirect_to root_path, alert: "Ocurrio un error"
              end
       end

       def api
              @tweets = Tweet.last_50_tweets
              render json: @tweets.to_json(only: [:id, :content, :user_id, :likes_count, :retweets_count, :retweets_from])
       end

       private
              def tweets_params
                     params.permit(:content)
              end

              def set_tweet
                     @tweet = Tweet.find(params[:id])
              end
end