Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  # resources :doses, only: [:destroy]

  namespace :adminpl241 do
    resources :cocktails do
      resources :doses, only: [:new, :create]
    end

    resources :doses, only: [:destroy]
  end

  root 'cocktails#index'
end
