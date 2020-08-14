class Api::V1::ClubsController < SecuredController

  before_action :find_club, only: [:clubdetails, :update]

  def index
    @clubs = Club.select(:id,:shortname,:name,:town,:acronym)
		render json: @clubs
	end

  def create
		new_club = Club.create!(name:params[:name],shortname:params[:shortname],town:params[:town],acronym:params[:acronym])
		render json: new_club, status: :created
  end

  def clubdetails
    @teams=Team.where(club: Club.find(@club.id)).select(:id,:level)

    render :json => {
              name: @club.name,
              shortname: @club.shortname,
              acronym: @club.acronym,
              city: @club.town,
							teams: @teams
						}
  end

  def update
		if @club
			@club.update(club_params)
			render json: {message: "Club successfully updated!", league: @club},
				status: 200
		else
			render json: {message: "Unable to update the club"}, status: 400
		end
  end

  private

	def find_club
		@club = Club.find(params[:id])
	end

  def club_params
    params.permit(:name, :shortname, :acronym, :town)
  end

end
