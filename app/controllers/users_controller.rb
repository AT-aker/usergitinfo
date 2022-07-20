# frozen_string_literal: true

# Controller for search and pars github user for his login
# and return name and all repositories

require 'graphql'
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
    user_1 = git_info 'https://api.github.com/users/%s', format('%s', @user.login)
    @user['full_name'] = user_1['name']
    rep = git_repo_list(@user.login)
    rep.each do |i|
      repo = @user.repos.build(name: format('%s', i))
    end
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @repos = @user.repos.where(user: format('%s', params[:id])).order created_at: :desc
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

  def git_info(url_1, login)
    url = format(url_1, login)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    content = response.body
    string_1 = JSON.parse content
    q = string_1
  end

  def git_repo_list(login)
    data_1 = git_info 'https://api.github.com/users/%s/repos', format('%s', login)
    data_2 = []
    data_1.each do |i|
      i.each do |k, v|
        data_2 << v if k == 'name'
      end
    end
    data_2
  end
end
