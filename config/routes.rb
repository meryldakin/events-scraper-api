Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show', as: "event"
  get '/users/:id', to: 'users#show', as: "user"
  get '/users/:user_id/events', to: 'user_events#index'
end
