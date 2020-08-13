class Api::V1::TeamsController < SecuredController

  skip_before_action :authorize_request, only: [:index]

  def index
    @teams = Team.select(:id,:club_id,:level)
    render json: @teams
  end
end
