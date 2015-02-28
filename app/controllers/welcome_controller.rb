class WelcomeController < ApplicationController
  def index
    if logged_in?  
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      render layout: "application"
    else
      render layout: "frontpage"
    end
  end
end
