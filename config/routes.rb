Rails.application.routes.draw do
  resources :articles
  resources :subscribers, only: [:index, :new, :create] do
    get :verify, on: :collection
    get :unsubscribe
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'p/:slug', to: 'articles#permalink', as: :permalink

  root to: 'articles#index'
end
