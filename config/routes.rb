Rails.application.routes.draw do

  resources :card_files
  root 'boards#index'
  get 'home', controller: :home, action: :index, as: :home
  get 'search', controller: :cards, action: :index, as: :search

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
