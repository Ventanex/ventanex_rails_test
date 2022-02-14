Rails.application.routes.draw do
  devise_for :users
  resources :pay_accounts

  root 'pay_accounts#index'
end
