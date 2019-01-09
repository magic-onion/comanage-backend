Rails.application.routes.draw do
  resources :roommembers
  resources :members
  resources :rooms
  resources :communities
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
