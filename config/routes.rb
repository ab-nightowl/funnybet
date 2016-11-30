Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  get "rank", to: "pages#rank"
  resources :users, only: [:show]
  resources :bets, only: [:index, :show, :new, :create, :edit, :update] do
    resources :user_choices, only: [:create]
  end

  resources :choices, only: [] do
    member do
      post "gains"
    end
  end
end
