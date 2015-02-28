class WelcomeController < ApplicationController
  def index
    @micropost = current_user.microposts.build if logged_in?
    if logged_in?  
      render layout: "application"
    else
      render layout: "frontpage"
    end
  end
end
