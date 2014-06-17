Sprint::Application.routes.draw do
  devise_for :admins
  resources :teams, :submissions, :rankings, :problems
  root to: 'pages#rules'
  get '/rules', to: 'pages#rules'
  get '/meetups', to: 'pages#meetups'
  get '/rankings', to: 'rankings#index'
  get '/check', to: 'problems#check', as: :check
  match '/submissions/new', to: 'submissions#create', via: :post
end
