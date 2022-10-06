Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :fans, only: %i[new create destroy]
  resources :contents, only: %i[create destroy]
  resources :requests, shallow: true do
    resources :answers, only: %i[create destroy]
  end
  resources :promotions, shallow: true do
    resources :comments, only: %i[create destroy]
  end
end
