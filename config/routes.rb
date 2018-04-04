Rails.application.routes.draw do



  resources :trips do
    resources :passengers
  end


  resources :passengers


  resources :drivers


  root 'trips#index' #defines homepage
end
