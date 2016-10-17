Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  namespace :api do
    resources :users
    resources :chatrooms do
      get :search
      member do
        put 'messages_status', to: 'message_statuses#messages_status'
      end
    end
    resources :messages
    resources :attachments
    resources :sessions
    resources :message_statuses
  end
end
