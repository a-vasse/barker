Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
  end

  resources :barks

  resources :users do
    member do
      get :follow
      get :unfollow
    end
    resources :barks, only: [:index, :create, :destroy]
  end
end
