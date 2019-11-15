Rails.application.routes.draw do
  get 'customers/index'
  root to: 'customers#index'
  resources :customers, except: [:new, :create, :delete]
  get 'blacklist', action: :blacklist, controller: 'customers'
end
