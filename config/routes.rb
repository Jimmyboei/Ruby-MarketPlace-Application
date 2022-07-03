Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  root 'home#index'
  resources :listings
  resources :categories
  resources :messages
  # get 'messages/new/listing_id/user_id/', to: 'messages#new', as: 'reply_message'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
