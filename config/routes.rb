Rails.application.routes.draw do
  resources :questions
  resources :surveys
  resources :contacts
  devise_for :users
  resources :users
  resources :contacts
  get 'response', to: 'response#show'
  root 'welcome#index'
  # resource :welcome, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
