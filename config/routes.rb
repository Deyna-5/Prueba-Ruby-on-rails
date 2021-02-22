Rails.application.routes.draw do

  resources :tweets do
    resources :likes
    member do
      post :retweet
    end
  end

  

  devise_for :users,  controllers: {registrations: 'users/registrations'} do
    #resource :friends, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'tweets', to: "friend#follow"
  delete 'twees/index', to: "friend#unfollow"

  root "tweets#index"
end
