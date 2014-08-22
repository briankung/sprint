Sprint::Application.routes.draw do
  root to: 'pages#home'

  get '/details' => 'pages#details'
  get '/conduct' => 'pages#conduct'

  get 'problems' => 'problems#index', as: 'problems'
  get 'problem/:number' => 'problems#show', as: 'problem'

  get 'chapters' => 'chapters#index'
  resources 'chapters', except: [:index], path: 'chapter' do
    resources 'events', only: [:new, :create]
  end

  get 'events' => 'events#index'
  resources 'events', only: [:edit, :show, :update], path: 'event' do
    member { get 'manage' => 'events#manage' }
  end

  resources :teams, :submissions, only: [:edit, :update, :create]

  devise_for :admins, skip: :registrations
  devise_scope :admin do
    get 'admins/edit' => 'devise/registrations#edit', as: 'edit_admin_registration'
    patch 'admins/:id' => 'devise/registrations#update', as: 'admin_registration'
  end
end
