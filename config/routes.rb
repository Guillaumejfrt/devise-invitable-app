Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'pages#home'

  resources :events, only: [:new, :create, :show] do
    member do
      post 'invite', to: "guests#invite"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
