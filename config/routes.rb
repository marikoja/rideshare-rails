Rails.application.routes.draw do

  resources :trips
  
  resources :drivers
  root 'trips#index' #defines homepage
end
