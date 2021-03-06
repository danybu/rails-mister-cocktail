Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :show, :create, :destroy]
  end
  resources :doses, only: [:destroy]
  root to: 'cocktails#index'

end
