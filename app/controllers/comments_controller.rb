class CommentsController < ApplicationController

  def new
    @review = Review.find_by(id: params[:id])
    @comment = Comment.new(params[:comment])
  end

  def create
    @comment = Comment.create!(comments_params)
    @review = Review.find_by(id: params[:id])
    @film = @review.film
    redirect_to film_path(@film)
  end

  def update
    @review = Review.find_by(id: params[:comment][:review_id])
    @comment = Comment.find_by(id: params[:id]) || Comment.find_by( id: params[ :comment ][ :comment_id ] )
    @film = @comment.review.film
    @comment.update_attributes(comments_params)
    redirect_to film_path(@film)
  end

  def edit

    @comment = Comment.find_by(id: params[:id])

    @review = @comment.review
  end


 private
  def comments_params
    params.require(:comment).permit(:body, :user_id, :review_id, :flag)
  end
end
