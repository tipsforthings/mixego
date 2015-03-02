class WelcomeController < ApplicationController
  def index
    if logged_in?  
      @micropost = current_user.microposts.build
      @track = current_user.tracks.build
      @feed_items = current_user.feed.order('microposts.created_at DESC').page params[:feed]
      @stream_items = current_user.stream.order('tracks.created_at DESC').page params[:stream]
      render layout: "application"
    else
      render layout: "frontpage"
    end
  end
end
