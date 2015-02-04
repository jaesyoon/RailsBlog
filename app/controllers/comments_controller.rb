class CommentsController < ApplicationController
  
  def create
  @post = Post.find(params[:post_id])
  @comment = Comment.new(comment_params)
  @comment = @post.comments.new(comment_params)
  @comment.user_id = current_user.id #or whatever is you session name
  if @comment.submit
    redirect_to @post
  else
    flash.now[:alert] = "error"
  end

  private

  def comment_params
  	params.require(:comment).permit(:body, :user_id, :post_id, :created_at, :updated_at :)
  end
end








  
  	


