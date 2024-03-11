Rails.application.routes.draw do
  # get 'friend/new'
  # get 'friend/create'
  # get 'friend/show_all'
  
  # get 'session/new'
  # get 'session/create'

  # root
  root 'home#index'
  
  # sign-up
  get 'sign_up', to:'registraions#new'
  post 'sign_up', to:'registraions#create'

  # sign-in
  get 'sign_in', to:'session#new'
  post 'sign_in', to:'session#create'
  delete 'logout', to:'session#destroy'

  # friends
  get 'new_friend', to:'friend#new'
  post 'new_friend', to:'friend#create'

  get 'show_friends', to:'friend#show_all'

  get "up" => "rails/health#show", as: :rails_health_check
end
