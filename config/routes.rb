Rails.application.routes.draw do
  resources :districts do
  	resources :reports 
  end
end
