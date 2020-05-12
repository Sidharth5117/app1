Rails.application.routes.draw do
 devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: 'omniauth'} 
  devise_scope :user do
    get "/users" => "users/registrations#index"
    get "/users/:id" => "users/registrations#show", :as => :user
     get "/users/:id/verifyclub" => "users/registrations#verifyclub", :as => :verifyclub
   patch "/users/:id" => "users/registrations#updateclub"        
    get "/unverifiedclubs" => "users/registrations#unverifiedclubs", :as => :unverifiedclubs
   get "/unverifiedclubs/:id" => "users/registrations#adminverifyclub", :as => :adminverifyclub
   patch "/unverifiedclubs/:id" => "users/registrations#adminupdateclub"
  end




resources :categories, except: [:destroy]
root "home#index"
resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
