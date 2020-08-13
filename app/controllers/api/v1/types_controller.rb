class Api::V1::TypesController < SecuredController

  skip_before_action :authorize_request, only: [:index]

  def index
		@gametypes = Type.select(:id,:description)
		render json: @gametypes
	end

  def create
    new_type = Type.create!(type_params)
    render json: new_type, status: :created
  end

  private

  def type_params
    params.permit(:description)
  end

end
