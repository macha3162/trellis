Rails.application.routes.draw do

  root 'boards#index'

  resources :boards do
    resources :lists, expect: %i(index) do
      resources :cards do
        post 'sort'
      end
    end
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
