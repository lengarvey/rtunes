Rails.application.routes.draw do
  resource :queue, only: [ :show ]
  resources :songs, except: [ :show, :update ] do
    resource :queue, only: [ :create ]
  end

  post 'play', to: 'player#play'
  post 'stop', to: 'player#stop'

  root 'queues#show'
end
