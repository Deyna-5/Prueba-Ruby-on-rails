Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :tweets do
    resources :likes
    member do
      post :retweet
    end
  end

  devise_for :users,  controllers: {registrations: 'users/registrations'}

  get "friends/friends", as: "friends"

  get "api/news", to: "tweets#api"

  get "api/:fecha1/:fecha2", to: "tweets#date"

  root "tweets#index"

end
