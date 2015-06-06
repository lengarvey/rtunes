Rails.application.routes.draw do
  resource :queue, only: [ :show, :update ]
  resources :songs, except: [ :show, :update ]
  root 'queues#show'
end
