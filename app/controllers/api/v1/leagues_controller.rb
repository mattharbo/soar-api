class Api::V1::LeaguesController < ApplicationController


	# Please check the Medium article(s) that help(s) me to declare the controller
	# => https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc
	# => 


	before_action :find_league, only: [:show]

	# GET /leagues 
	def index
		@leagues = League.all
		render json: @leagues
	end

	def show
		render json: @league
	end

	# def new
		
	# end

	# def create
		
	# end

	# def edit
		
	# end

	# def update
		
	# end

	# def destroy
		
	# end

	private

	def find_league
		@league = League.find(params[:id])
	end

end
