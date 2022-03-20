Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations }
  resources :events do
    member { patch :set_private}
    member { patch :set_public}
  end
  resources :users
  resource :invites, only: %i[new create destroy]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
