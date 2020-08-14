class Api::V1::TeamsController < SecuredController

  skip_before_action :authorize_request, only: [:index]

  def index
    @teams = Team.select(:id,:club_id,:level)
    render json: @teams
  end

  def create
		new_team = Team.create!(club:Club.find(params[:club]),
      level:params[:level])
		render json: new_team, status: :created
  end
end
