class Api::V1::GamesController < SecuredController

  skip_before_action :authorize_request
  before_action :find_game, only: [:show]

  def show

    render :json => {
      # "Competition":
      "Game details": {
        stage: @game.round,
        date: @game.date,
        # time: @game.time, #==> Not ready yet! find a way to submit a time
        status: @game.gstate.description
      },
      "Participants": [
          hometeam: @game.hometeam.club.name,
          awayteam: @game.awayteam.club.name,
          hashtag: @game.hometeam.club.acronym+@game.awayteam.club.acronym
      ]
      # "Result": {
      #   home: @game.,
      # }
    }

	end

  private

  def find_game
		@game = Game.find(params[:id])
	end
end
