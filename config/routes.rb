Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :subscribers, only: [:index, :new, :create] do
    get :verify, on: :collection
    get :unsubscribe, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'p/:slug', to: 'articles#permalink', as: :permalink

  root to: 'subscribers#new'
end
