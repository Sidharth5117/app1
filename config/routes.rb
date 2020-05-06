Rails.application.routes.draw do
 devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: 'omniauth'} 
  devise_scope :user do
    get "/users" => "users/registrations#index"
    get "/users/:id" => "users/registrations#show", :as => :user
    
  end




resources :categories, except: [:destroy]
root "home#index"
resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
