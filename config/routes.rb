Rails.application.routes.draw do
  post ':user_id/events/:event_id/attendees' => 'attendees#create'
  delete ':user_id/events/:event_id/attendees' => 'attendees#destroy'

  get 'events' => 'events#index'
  post 'events/:user_id/create' => 'events#create'
  get 'events/:event_id' => 'events#show'
  delete 'events/:event_id' => 'events#destroy'
  
  root 'users#new'
  get 'users' => 'users#new'
  post 'users/new' => 'users#create'
  get 'users/:user_id' => 'users#show'
  patch 'users/:user_id/edit' => 'users#edit'
  delete 'users/:user_id' => 'users#destroy'

  get 'sessions/new' => 'users#new'
  post 'sessions/new' => 'sessions#create'
  delete 'sessions/new' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
