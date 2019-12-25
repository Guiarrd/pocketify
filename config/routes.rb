Rails.application.routes.draw do
  devise_for :users

  # dá pra ter mais de uma rota root, desde que sejam utilizados
  # os métodos authenticated do devise.
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated :user do
    root to: "home#index"
  end
end
