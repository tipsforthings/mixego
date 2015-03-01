class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @tracks = Track.all
  end

  def show
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
    @user = current_user
    @track = current_user.tracks.build(track_params)

    if @track.save
      flash[:success] = "Track created!"
      redirect_to tracks_path
    else
      @feed_items = []
      flash[:alert] = "Could not create track!"
      redirect_to tracks_path
    end
  end

  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:title, :description, :genre_id, :user_id)
    end

     def correct_user
      @track = current_user.tracks.find_by(id: params[:id])
      redirect_to root_url if @track.nil?
    end
end
