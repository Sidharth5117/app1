Rails.application.routes.draw do
 devise_for :users, controllers: {omniauth_callbacks: 'omniauth'} do

root "devise/sessions#new"

end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
