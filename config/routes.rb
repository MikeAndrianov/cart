Rails.application.routes.draw do
  resource :cart, only: :show do
    collection do
      post 'add'
      delete 'remove'
    end
  end

  get 'products', to: 'products#index'

  root 'products#index'
end
