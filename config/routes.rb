Rails.application.routes.draw do

  root 'boards#index'
  get 'home', controller: :home, action: :index, as: :home

  resources :boards do
    resources :users_boards, except: %i(new edit)
    resources :lists, only: %i(create update destroy) do
      resources :cards, except: %i(new edit) do
        post 'sort'
      end
    end
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
