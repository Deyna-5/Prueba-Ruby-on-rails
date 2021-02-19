class PagesController < ApplicationController

       def index
              @tweets = Tweet.order("created_at DESC")
              if current_user
                     @tweets = Tweet.all
              else
                     @tweets = Tweet.last_50_tweets
              end
       end

       def new
              #@Tweet = Tweet.new
       end

       def created
              #@tweet = Tweet.new(tweets_params)
              #@tweet.users_id = current_user.id

              #if @tweet.save
              #       flash[:success] = "Se genero el tweet de forma éxitosa"
              #       redirect_to root_path
              #else
              #       flash[:error] = "Hubo un error"
              #       render 'new'
              #end
       end


       private
              def tweets_params
                     params.require(:tweet).permit(:contents, :users_id)
                     
              end

end