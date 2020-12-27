Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :subscribers, only: [:index, :new, :create] do
    get :verify, on: :collection
    get :unsubscribe, on: :collection
  end

  resources :subscription_plans, only: [:create, :update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'admin', to: 'admin#index'
  get 'admin/edit_config/:id', to: 'admin#edit', as: :edit_config
  put 'admin/edit_config/:id', to: 'admin#update'
  patch 'admin/edit_config/:id', to: 'admin#update'

  get 'p/:slug', to: 'articles#permalink', as: :permalink

  root to: 'subscribers#new'
end
