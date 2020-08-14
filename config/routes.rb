Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
  	namespace :v1 do

  		# resource :leagues do
  		# 	resource :seasons
		  # end

  		get '/leagues/', to: 'leagues#index'
  		get '/league/:id', to: 'leagues#show'
      get '/league/:id/seasons', to: 'leagues#allseasonforleague'
      post '/league/new', to: 'leagues#create'
      put '/league/:id/edit', to: 'leagues#update'

  		get '/seasons/', to: 'seasons#index'
  		get '/season/:id', to: 'seasons#show'
      post '/season/new', to: 'seasons#create'

      get '/clubs/', to: 'clubs#index'
      get '/club/:id', to: 'clubs#clubdetails'
      post '/club/new', to: 'clubs#create'
      put '/club/:id/edit', to: 'clubs#update'

      get '/teams/', to: 'teams#index'

      get '/types/', to: 'types#index'
      post '/type/new', to: 'types#create'

      get '/statuses/', to: 'gstates#index'
      post '/statuse/new', to: 'gstates#create'

      get '/game/:id', to: 'games#show'
  	end
  end

end
