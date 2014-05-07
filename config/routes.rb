Sprint::Application.routes.draw do
  get '/rules', to: 'pages#rules'
  get '/meetups', to: 'pages#meetups'
  root to: 'pages#rules'
end
