class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    #@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], city: params[:city])
    @user = User.create(first_name: params[:first_name], email: params[:email], password: params[:password], city_id: City.all.sample.id)

    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render 'new'
      puts params
    end
  end

  def index
    @users = User.all
  end
end
