Rails.application.routes.draw do
  namespace :admin do
    resources :offers, except: :show
  end

  resource :cart, only: :show do
    collection do
      post 'add'
      delete 'remove'
    end
  end

  get 'products', to: 'products#index'

  root 'products#index'
end
