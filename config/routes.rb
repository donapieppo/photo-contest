Rails.application.routes.draw do
  # thanx to https://github.com/plataformatec/devise/wiki/How-To:-Use-Recaptcha-with-Devise
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :themes do
    resources :photos
    resources :videos
  end
  resources :photos
  resources :videos

  get  'edit_user_info',    to: 'users#edit_user_info', as: :edit_user_info
  get  'printable_release', to: 'users#release', as: :printable_release
  post 'update_user_info',  to: 'users#update_user_info', as: :update_user_info
  post 'delete_id_card',    to: 'users#delete_id_card', as: :delete_id_card

  get 'who_impersonate',    to: 'impersonations#who_impersonate',    as: :who_impersonate
  get 'impersonate/:id',    to: 'impersonations#impersonate',        as: :impersonate
  get 'stop_impersonating', to: 'impersonations#stop_impersonating', as: :stop_impersonating

  get 'privacy',       to: 'home#privacy',       as: :privacy

  root to: "home#index"
end
