class AppearancesController < ApplicationController

  def new
    @appearance=Appearance.new
  end

  def create
    @guest=Guest.find(appearance_params[:guest])
    @episode=Episode.find(appearance_params[:episode])
    @appearance=Appearance.new(guest_id: appearance_params[:guest], episode_id: appearance_params[:episode], rating: appearance_params[:rating])

    if @appearance.valid?
      @appearance=Appearance.create(guest_id: appearance_params[:guest], episode_id: appearance_params[:episode], rating: appearance_params[:rating])
      redirect_to episode_path(@episode)
    else
      render :new
    end

  end

  private
    def appearance_params
      params.require(:appearance).permit(:guest, :episode, :rating)
    end

end
