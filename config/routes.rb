Rails.application.routes.draw do

  resources :tweets

  devise_for :users,  controllers: {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "tweets/like", to: "tweets#like"
  get "tweets/dislike", to: "tweets#dislike"
  get "tweets/show", to: "tweets#show"

  root "tweets#index"
end
