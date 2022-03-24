Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations }
  resources :events do
    member do
      patch :set_private
      patch :set_public
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end
  resources :users
  resource :invites, only: %i[new create destroy]
  root to: 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
