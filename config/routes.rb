Rails.application.routes.draw do



  resources :trips

  resources :passengers
  root 'trips#index' #defines homepage
end
