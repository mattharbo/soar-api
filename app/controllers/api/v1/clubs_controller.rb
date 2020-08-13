class Api::V1::ClubsController < SecuredController

  before_action :find_club, only: [:clubdetails]

  def index
    @clubs = Club.select(:id,:name,:town,:acronym)
		render json: @clubs
	end

  def create
		new_club = Club.create!(name:params[:name],town:params[:town],acronym:params[:acronym])
		render json: new_club, status: :created
  end

  def clubdetails
    @teams=Team.where(club: Club.find(@club.id)).select(:id,:level)

    render :json => {
              name: @club.name,
              acronym: @club.acronym,
              city: @club.town,
							teams: @teams
						}
  end

  private

	def find_club
		@club = Club.find(params[:id])
	end

end
