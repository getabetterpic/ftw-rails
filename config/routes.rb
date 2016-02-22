Rails.application.routes.draw do
  jsonapi_resources :accounts
  jsonapi_resources :transactions
  jsonapi_resources :people
  post 'accounts/sync' => 'accounts#sync'
  post 'users/sign_in' => 'sessions#create'
  get 'institutions' => 'institutions#index'
  post 'accounts/mfa' => 'accounts#mfa'
  post 'accounts/link' => 'accounts#link'
  get 'transactions/webhook' => 'transactions#webhook'
  post 'transactions/webhook' => 'transactions#webhook'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
