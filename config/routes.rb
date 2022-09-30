Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :user_sessions, only: %i[new create destroy]
  resources :fans, only: %i[new create destroy]
end
