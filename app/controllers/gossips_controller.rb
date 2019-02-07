class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new, :edit, :update, :destroy]

  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content])
    @gossip.user = current_user

    if @gossip.save
      redirect_to gossips_path
    else
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end


  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(gossip_params)
      redirect_to gossip_path

    else
      render :edit
    end
  end

  def destroy
   @gossip = Gossip.find(params[:id])

   @gossip.destroy
   redirect_to gossips_path
 end

 def index
  @gossips = Gossip.all
  end

  private

  def authenticate_user

    unless current_user
      flash[:danger] = "Tu dois d'abord te connecter"
      redirect_to new_session_path
    end
  end

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
