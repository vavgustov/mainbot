Rails.application.routes.draw do
  namespace :octobot do
    resources :languages
    resource :status, only: :update, controller: :trend_statuses
    root 'trends#index'
  end

  namespace :foodbot do
    resources :retailers
    resources :products
    root 'deals#index'
  end

  get 'crawler', to: 'crawler#index'

  root 'pages#home'
end
