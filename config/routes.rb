Rails.application.routes.draw do

  resources :passengers do
    resources :trips, only:[ :index, :new, :create, :show, :edit ]
  end

  resources :trips 

  resources :passengers

  resources :drivers

  root 'trips#index' #defines homepage
end
