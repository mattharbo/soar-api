class Api::V1::GamesController < SecuredController

  before_action :find_game, only: [:show]

  def create
		new_game = Game.create!(type:Type.find(params[:type]),
      gstate:Gstate.find(params[:status]),
      round:params[:round],
      date:params[:date],
      time:Time.now, # by default but it should be handled in the future
      hometeam:Team.find(params[:hometeam]),
      awayteam:Team.find(params[:awayteam]),
      season:Season.find(params[:season]))
		render json: new_game, status: :created
  end

  def show

    render :json => {
      id: @game.id,
      competition:{
        name: @game.season.league.name,
        season: @game.season.year
      },
      details: {
        stage: @game.round,
        type: @game.type.description,
        date: @game.date,
        # time: @game.time, #==> Not ready yet! find a way to submit a time
        status: @game.gstate.description
      },
      participants: [
          hometeam: @game.hometeam.club.name,
          awayteam: @game.awayteam.club.name,
          hashtag: @game.hometeam.club.acronym+@game.awayteam.club.acronym
      ],
      result: {
        home: @game.scorehome,
        away: @game.scoreaway,
      }
    }

	end

  private

  def find_game
		@game = Game.find(params[:id])
	end
end
