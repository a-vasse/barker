Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
  end

  resources :barks

  resources :users do
    resources :barks
  end
end
