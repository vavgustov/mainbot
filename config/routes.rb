Rails.application.routes.draw do
  namespace :octobot do
    resources :languages
    get 'mark', to: 'trends#mark'
    get 'run', to: 'data#run'
    root 'trends#index'
  end

  namespace :foodbot do

  end

  root 'pages#home'
end
