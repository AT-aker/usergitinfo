class FoundsController < ApplicationController
  def index
    @users = User.all
  end
   
  def new
    @user = User.new
  end

  def create
    @user = User.new user_param

    if @user.save
      redirect_to founds_path
    else
      render :new
    end
  end

  private

  def user_param
    params.require(:user).permit(:login)
  end
end