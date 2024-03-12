Rails.application.routes.draw do

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
  get 'show_that_friend', to:'friend#show_that_friend'

  post 'delete_friend', to:'friend#delete_friend'
  get 'edit_friend', to:'friend#edit_friend'
  post 'edit_friend', to:'friend#edit_on_submit'

  get "up" => "rails/health#show", as: :rails_health_check
end
