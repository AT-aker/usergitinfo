# frozen_string_literal: true

require "graphql"
require 'json'
require 'net/http'
require 'uri'



class UsersController < ApplicationController
  def index
    @users = User.all
  end
   
  def new
    @user = User.new
  end

  def create
    @user = User.new user_param
    user_1 = git_info "https://api.github.com/users/%s", '%s' % [@user.login]
    @user['full_name'] = user_1["name"]
    rep = git_repo_list(@user.login)
    for i in rep do
      repo = @user.repos.build(name: '%s' % [i])
    end
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @repos = @user.repos.where(user: '%s' % [params[:id]]).order created_at: :desc

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

  
  def git_info url_1, login
    url = url_1 % [login]
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    content = response.body
    string_1 = JSON.parse content
    q = string_1
    
  end

  def git_repo_list login
    data_1 = git_info "https://api.github.com/users/%s/repos", '%s' % [login]
    data_2 = []
    for i in data_1 do
      for k, v in i do
        if k == 'name'
          data_2 << v
        end
      end
    end
    return data_2
  end

end