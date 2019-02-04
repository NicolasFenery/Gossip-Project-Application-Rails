class UsersController < ApplicationController
  def profile
    @users = User.find(params[:id])
  end
end
