class AppearancesController < ApplicationController
  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
    @episode = Episode.all
  end

  def create
    episode_id = appearance_params["episode_id"]
    guest = Guest.find_or_create_by(name: appearance_params[:guest]) do
      |guest| guest.name
    end
    @appearance = Appearance.create(rating: appearance_params["rating"], episode_id: episode_id, guest_id: guest.id)
    redirect_to @appearance
  end

  private
  def appearance_params
    params.require(:appearance).permit(:rating, :episode_id, :guest)
  end
end
