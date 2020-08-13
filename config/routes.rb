Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'teams/index'
    end
  end
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
  	namespace :v1 do

  		# resource :leagues do
  		# 	resource :seasons
		  # end

  		get '/leagues/', to: 'leagues#index'
  		get '/leagues/:id', to: 'leagues#show'
      get '/leagues/:id/seasons', to: 'leagues#allseasonforleague'
      post '/leagues/new', to: 'leagues#create'
      put '/leagues/:id/edit', to: 'leagues#update'

  		get '/seasons/', to: 'seasons#index'
  		get '/seasons/:id', to: 'seasons#show'
      post '/seasons/new', to: 'seasons#create'

      get '/clubs/', to: 'clubs#index'
      get '/clubs/:id', to: 'clubs#clubdetails'

      get '/teams/', to: 'teams#index'
  	end
  end

end
