class LikesController < ApplicationController

  before_action :authenticate_user, only: [:new, :create]

  def new
    @like = Like.new
  end

  def create
    @like = Like.create
    @like.user = current_user

    if @like.save
    flash[:success] = "Tu viens de liker ce secret"
    end
  end

  private

  def authenticate_user

    unless current_user
      flash[:danger] = "Tu dois d'abord te connecter"
    end
  end
end
