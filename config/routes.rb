Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
  	namespace :v1 do

  		# resource :leagues do
  			# resource :seasons
		# end

		get '/leagues/', to: 'leagues#index'
		get '/leagues/:id', to: 'leagues#show'
    get '/leagues/:id/seasons', to: 'leagues#allseasonforleague'
    post '/leagues/new', to: 'leagues#create'
    put '/leagues/:id/update', to: 'leagues#update'

		get '/seasons/', to: 'seasons#index'
		get '/seasons/:id', to: 'seasons#show'

    get '/clubs/', to: 'clubs#index'
    get '/clubs/:id', to: 'clubs#clubdetails'
  	end
  end

end
