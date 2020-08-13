class Api::V1::GstatesController < SecuredController

  skip_before_action :authorize_request, only: [:index]

  def index
		@gamestates = Gstate.select(:id,:description)
		render json: @gamestates
	end

  def create
    new_state = Gstate.create!(gstate_params)
    render json: new_state, status: :created
  end

  private

  def gstate_params
    params.permit(:description)
  end


end
