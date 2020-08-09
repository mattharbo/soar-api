class Api::V1::SeasonsController < SecuredController

	skip_before_action :authorize_request, only: [:index]
	before_action :find_season, only: [:show]

	def index
		@seasons = Season.select(:id,:year,:league_id,:stage)
		render json: @seasons
	end

	def show
		render json: @season
	end

	def create
		@league = League.find(params[:league])
		new_season = Season.create!(year:params[:year],stage:params[:stage],league:@league)
		render json: new_season, status: :created
	end

	private

	def find_season
		@season = Season.find(params[:id])
	end

	# def season_params
	# 	params.permit(:year, :stage, @league)
	# end

end
