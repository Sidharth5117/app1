Rails.application.routes.draw do
 devise_for :users, controllers: {registrations: "users/registrations", omniauth_callbacks: 'omniauth'} 
  devise_scope :user do
    get "/users" => "users/registrations#index"
    get "/users/:id" => "users/registrations#show", :as => :user
     get "/users/:id/verifyclub" => "users/registrations#verifyclub", :as => :verifyclub
    patch "/users/:id/verifyclub" => "users/registrations#updateclub"
    get "/unverifiedclubs/" => "users/registrations#unverifiedclubs", :as => :unverifiedclubs
   get "/unverifiedclubs/:id/adminverifyclub" => "users/registrations#adminverifyclub", :as => :adminverifyclub
   patch "/unverifiedclubs/:id/adminverifyclub" => "users/registrations#adminupdateclub"
  end




resources :categories, except: [:destroy]
root "home#index"
resources :events
get "/unverifiedevents/" => "events#unverifiedevents", :as => :unverifiedevents
get "/unverifiedevents/:id/adminverifyevent" => "events#adminverifyevent", :as => :adminverifyevent

get "/findbyname/" => "findbyname#index", :as => :findbyname1
get "/findbyname/search/" => "findbyname#search", :as => :findbyname 


get "/findbydate/" => "findbydate#index", :as => :findbydate1
get "/findbydate/search/" => "findbydate#search", :as => :findbydate


patch "/unverifiedevents/:id/adminverifyevent" => "events#adminupdateevent"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
