Rails.application.routes.draw do
  devise_for :users

  resources :themes
  resources :photos

  get  'edit_user_info', to: 'users#edit_user_info', as: :edit_user_info
  get  'printable_release',        to: 'users#release', as: :printable_release
  post 'update_user_info', to: 'users#update_user_info', as: :update_user_info

  root to: "home#index"
end
