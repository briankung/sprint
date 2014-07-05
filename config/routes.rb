Sprint::Application.routes.draw do
  resources :events

  devise_for :admins, skip: :registrations
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    patch 'admins/:id' => 'devise/registrations#update', :as => 'admin_registration'
  end
  resources :teams, :submissions, :rankings, :problems
  root to: 'pages#fivek'
  get '/rules', to: 'pages#rules'
  get '/meetups', to: 'pages#meetups'
  get '/rankings', to: 'rankings#index'
  get '/fivek', to: 'pages#fivek'
  match '/submissions/new', to: 'submissions#create', via: :post
end
