Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
      get :edit_division
      patch "/edit_division", to: "users#update"
      patch "/switch_division", to: "users#add_to_your_division"
      patch :promote, :demote
    end
  end
  resources :account_activations, only: :edit
  resources :divisions, except: :destroy
  resources :positions, except: :destroy
  resources :requests
  resources :relationships, only: %i(create destroy)
end
