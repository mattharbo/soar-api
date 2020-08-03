Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
  	namespace :v1 do
  		# resource :leagues
  		get '/leagues/', to: 'leagues#index'
  		get '/leagues/:id', to: 'leagues#show'
  	end
  end

end
