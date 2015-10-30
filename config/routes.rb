Rails.application.routes.draw do
  resources :districts do
  	resources :reports 
  end

resources :reports, only: [:index]
end
