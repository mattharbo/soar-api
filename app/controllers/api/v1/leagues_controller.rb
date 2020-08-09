	class Api::V1::LeaguesController < SecuredController


	# Please check the Medium article(s) that help(s) me to declare the controller
	# => https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc
	# =>

	skip_before_action :authorize_request, only: [:index]
	before_action :find_league, only: [:show, :allseasonforleague]

	# GET /leagues
	def index
		@leagues = League.select(:id,:name)
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

	def allseasonforleague
		@seasons=Season.where(league: League.find(@league.id)).select(:id,:year,:stage)

		render :json => {
							name: @league.name,
							seasons: @seasons
						}
	end

	private

	def find_league
		@league = League.find(params[:id])
	end

end
