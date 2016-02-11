Rails.application.routes.draw do
  get 'sessions/create'

  jsonapi_resources :accounts
  jsonapi_resources :transactions
  post 'accounts/sync' => 'accounts#sync'
  post 'people/sign_in' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
