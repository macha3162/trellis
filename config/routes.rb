Rails.application.routes.draw do

  root 'boards#index'
  get 'home', to: 'home#index', as: :home
  get 'search', to: 'cards#index', as: :search

  resources :boards do
    resources :users_boards, except: %i(new edit)
    resources :lists, only: %i(create update destroy) do
      resources :cards, except: %i(new edit) do
        post 'sort'
        resources :comments, only: %i(create update destroy)
      end
    end
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
