Rails.application.routes.draw do
  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # end
  # post "/graphql", to: "graphql#execute"
  resources :founds 

  # get '/founds', to: 'founds#index'
  # get '/founds/new', to: 'founds#new'
  # post '/founds', to: 'founds#create'

  root "pages#index"

end
