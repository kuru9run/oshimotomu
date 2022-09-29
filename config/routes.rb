Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new]
  resources :user_sessions, only: %i[new create destroy]
end
