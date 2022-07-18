Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  resources :users

  # get '/founds', to: 'founds#index'
  # get '/founds/new', to: 'founds#new'
  # post '/founds/new', to: 'founds#create'

  root 'pages#index'
end
