class Api::V1::SeasonsController < ApplicationController


	before_action :find_season, only: [:show]

	def index
		@seasons = Season.all
		render json: @seasons
	end

	def show
		render json: @season
	end

	private

	def find_season
		@season = Season.find(params[:id])
	end

end