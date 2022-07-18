class UsersController < ApplicationController
  def index
    @users = User.all
  end
   
  def new
    @user = User.new
  end

  def create
    @user = User.new user_param

    if @user.save

      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_param
    params.require(:user).permit(:login)
  end

  def git_info
    
  end

end