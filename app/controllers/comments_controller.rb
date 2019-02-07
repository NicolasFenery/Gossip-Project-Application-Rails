class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create 
     @comment = Comment.create(comments_params)
     @comment.user = current_user
     @comment.gossip_id = params[:gossip_id]

    if @comment.save
      redirect_to gossip_path(@comment.gossip)
    else
      render 'show'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
