Sprint::Application.routes.draw do
  devise_for :admins, skip: :registrations
  resources :teams, :submissions, :rankings, :problems
  root to: 'pages#fivek'
  get '/rules', to: 'pages#rules'
  get '/meetups', to: 'pages#meetups'
  get '/rankings', to: 'rankings#index'
  get '/fivek', to: 'pages#fivek'
  match '/submissions/new', to: 'submissions#create', via: :post
end
