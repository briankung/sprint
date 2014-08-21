Sprint::Application.routes.draw do
  root to: 'pages#home'

  get '/rules' => 'pages#rules'
  get '/conduct' => 'pages#conduct'

  get 'problems' => 'problems#index', as: 'problems'
  get 'problem/:number' => 'problems#show', as: 'problem'

  get 'chapters' => 'chapters#index', as: 'chapters'
  get 'chapter/:id' => 'chapters#show', as: 'chapter'

  get 'events' => 'events#index', as: 'events'
  get 'event/:id' => 'events#show', as: 'event'
  get 'event/:id/edit' => 'events#edit', :as => 'edit_event'
  get 'event/:id/manage' => 'events#manage', :as => 'manage_event'
  patch 'event/:id' => 'events#update'
  get 'chapter/:chapter_id/events/new' => 'events#new', as: 'new_event'
  post 'chapter/:chapter_id/events' => 'events#create'

  get 'team/:id/edit' => 'teams#edit', as: 'edit_team'
  patch 'team/:id' => 'teams#update', as: 'team'
  post 'teams' => 'teams#create', as: 'teams'

  get 'submission/:id/edit' => 'submissions#edit', as: 'edit_submission'
  patch 'submission/:id' => 'submissions#update', as: 'submission'
  post 'submissions' => 'submissions#create', as: 'submissions'


  devise_for :admins, skip: :registrations
  get 'admins/edit' => 'devise/registrations#edit', as: 'edit_admin_registration'
  patch 'admins/:id' => 'devise/registrations#update', as: 'admin_registration'
end
