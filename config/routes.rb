Sprint::Application.routes.draw do
  root to: 'pages#home'

  get '/rules', to: 'pages#rules'

  get 'problems', to: 'problems#index', as: 'problems'
  get 'problem/:number', to: 'problems#show', as: 'problem'

  get 'chapters', to: 'chapters#index', as: 'chapters'
  get 'chapter/:id', to: 'chapters#show', as: 'chapter'

  get 'events', to: 'events#index', as: 'events'
  get 'event/:id', to: 'events#show', as: 'event'
  get 'event/:id/edit', to: 'events#edit', :as => 'edit_event'
  get 'event/:id/manage', to: 'events#manage', :as => 'manage_event'
  patch 'event/:id', to: 'events#update'
  get 'chapter/:chapter_id/events/new', to: 'events#new', as: 'new_event'
  post 'chapter/:chapter_id/events', to: 'events#create'

  get 'team/:id/edit', to: 'teams#edit', as: 'edit_team'
  patch 'team/:id', to: 'teams#update', as: 'team'
  post 'teams', to: 'teams#create', as: 'teams'

  get 'submission/:id/edit', to: 'submissions#edit', as: 'edit_submission'
  patch 'submission/:id', to: 'submissions#update', as: 'submission'
  post 'submissions', to: 'submissions#create', as: 'submissions'


  devise_for :admins, skip: :registrations
  get 'admins/edit' => 'devise/registrations#edit',
    :as => 'edit_admin_registration'
  patch 'admins/:id' => 'devise/registrations#update',
    :as => 'admin_registration'
end
