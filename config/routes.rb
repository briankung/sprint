Sprint::Application.routes.draw do
  resources :teams, :submissions, :rankings
  root to: 'pages#rules'
  get '/rules', to: 'pages#rules'
  get '/meetups', to: 'pages#meetups'
  get '/rankings', to: 'rankings#index'
  match '/submissions/new', to: 'submissions#create', via: :post
end
