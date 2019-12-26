Rails.application.routes.draw do
  get 'artists/show'
  get 'categories/show'
  get 'search/index'
  get 'search/new'
  devise_for :users

  # dá pra ter mais de uma rota root, desde que sejam utilizados
  # os métodos authenticated do devise.
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
    resources :search, only: [:index, :new], as: :searches
    resources :categories, only: :show
    resources :artists, only: :show
  end

  unauthenticated :user do
    root to: "home#index"
  end
end
