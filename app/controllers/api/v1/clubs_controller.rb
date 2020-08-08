class Api::V1::ClubsController < ApplicationController

  def index
    @clubs = Club.select(:id,:name,:town,:acronym)
		render json: @clubs
	end

end
