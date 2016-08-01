Rails.application.routes.draw do

  root 'boards#index'
  resources :boards

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
