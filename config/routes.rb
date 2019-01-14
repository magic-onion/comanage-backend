Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :communities
      resources :rooms
      resources :members
      resources :roommembers
      get "/members/:id/rooms", to: 'members#show_rooms'
      get "/rooms/:id/members", to: 'rooms#show_members'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
