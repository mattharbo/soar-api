	class Api::V1::LeaguesController < SecuredController


	# Please check the Medium article(s) that help(s) me to declare the controller
	# => https://medium.com/@oliver.seq/creating-a-rest-api-with-rails-2a07f548e5dc
	# =>

	skip_before_action :authorize_request, only: [:index]
	before_action :find_league, only: [:show, :allseasonforleague, :update]

	# GET /leagues
	def index
		@leagues = League.select(:id,:name)
		render json: @leagues
	end

	def show
		render json: @league
	end

	def create
    new_league = League.create!(league_params)
    render json: new_league, status: :created
  end

	def update
		if @league
			@league.update(league_params)
			render json: {message: "League successfully updated!", league: @league},
				status: 200
		else
			render json: {message: "Unable to update the league"}, status: 400
		end
  end

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

	def league_params
    params.permit(:name)
  end

end
