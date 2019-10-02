Rails.application.routes.draw do
  devise_for :users

  get  'edit_user_info', to: 'users#edit_user_info', as: :edit_user_info
  post 'update_user_info', to: 'users#update_user_info', as: :update_user_info

  root to: "home#index"
end
