Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'static_pages#top'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  resource :mypage, only: %i[show edit update]
  resource :timeline, only: %i[show] do
    post 'requests', to: 'timelines#requests'
    post 'promotions', to: 'timelines#promotions'
  end
  resources :users, only: %i[new create show] do
    resource :relationships, only: %i[create destroy]
    get 'followings', to: 'relationships#followings', as: 'followings'
    get 'followers', to: 'relationships#followers', as: 'followers'
  end
  resources :follows, only: %i[new create destroy]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'images/ogp.png', to: 'shares#generate', as: 'ogp_generate'
  resources :fans, only: %i[new create destroy] do
    member do
      post 'input'
    end
  end
  resources :contents, only: %i[create destroy]
  resources :groups, only: %i[create destroy]
  resources :requests, shallow: true do
    resources :answers, only: %i[create destroy]
  end
  resources :promotions, shallow: true do
    resources :comments, only: %i[create destroy]
  end
  resources :request_bookmarks, only: %i[create destroy]
  resources :promotion_bookmarks, only: %i[create destroy]
  resources :favorites, only: %i[index show] do
    collection do
      post 'search'
    end
  end
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
end
