class Api::V1::GamesController < SecuredController

  skip_before_action :authorize_request
  before_action :find_game, only: [:show]

  def show
		render json: @game
	end

  private

  def find_game
		@game = Game.find(params[:id])
	end
end
