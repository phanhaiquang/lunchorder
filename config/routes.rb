Rails.application.routes.draw do
  devise_for :users
  root "application#dashboard"
  
  resources :dishes
  post 'order', to: 'application#order'
end
