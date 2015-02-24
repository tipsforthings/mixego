class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render layout: "frontpage"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to MixEgo!"
      redirect_to @user
    else
      render 'new', layout: "frontpage"
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
