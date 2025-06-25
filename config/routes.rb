Rails.application.routes.draw do
  get 'home/index'
  resources :companies do
    resources :jobs, only: [:new, :create], shallow: true
  end

  resources :jobs, only: [:index, :show, :edit, :update, :destroy]

  resources :candidates

  resources :applications, only: [:index, :create, :destroy, :show, :edit, :update, :new]

  root "home#index"
end
