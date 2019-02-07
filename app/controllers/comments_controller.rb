class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create 
     @comment = Comment.create(content: params[:content], user_id: User.all.sample.id)

    if @comment.save
      redirect_to gossip_path
    else
      render 'show'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end
end
