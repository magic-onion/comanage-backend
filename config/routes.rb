Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/profile', to: 'users#profile'
      get "/members/:id/rooms", to: 'members#show_rooms'
      get "/rooms/:id/members", to: 'rooms#show_members'
      get '/users/:id/rooms', to: 'user#user_rooms'
      get '/users/:id/member', to: 'users#member_data'
      get '/communities/:id/gettodos', to: 'communities#get_todos'

      post '/login', to: 'auth#create'
      post '/users/new', to: 'users#add_member'

      patch '/users/:id/authorize', to: 'users#authorize_member'

      mount ActionCable.server => '/cable'

      resources :todos
      resources :users
      resources :communities
      resources :rooms
      resources :members
      resources :roommembers
      resources :roomusers
      resources :communityusers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
