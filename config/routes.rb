Rails.application.routes.draw do
  resource :queue, only: [ :show ]
  resources :songs, except: [ :show, :update ] do
    resource :queue, only: [ :create ]
  end

  root 'queues#show'
end
