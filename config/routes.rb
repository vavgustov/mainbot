Rails.application.routes.draw do
  namespace :octobot do
    resources :languages
    get 'mark', to: 'trends#mark'
    get 'run', to: 'data#run'
    root 'trends#index'
  end

  namespace :foodbot do
    resources :retailers
    resources :products
    get 'run', to: 'data#run'
    root 'deals#index'
  end

  root 'pages#home'
end
