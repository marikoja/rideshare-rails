Rails.application.routes.draw do



  resources :trips


  resources :passengers


  resources :drivers

  root 'trips#index' #defines homepage
end
