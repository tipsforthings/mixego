class TracksController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @user = User.find(params[:id])
    @tracks = Track.page params[:track]
  end

  def destroy
    @track.destroy
    flash[:success] = "Track deleted"
    redirect_to request.referrer || root_url
  end

  private

    def track_params
      params.require(:track).permit(:title, :description, :genre)
    end

     def correct_user
      @track = current_user.tracks.find_by(id: params[:id])
      redirect_to root_url if @track.nil?
    end
end
