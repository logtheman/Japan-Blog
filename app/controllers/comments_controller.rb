class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
  	@comment.save
    redirect_to posts_path

  end

  def destroy
    @comment = Comment.find(params[:id]
    @comment.destroy
   
    redirect_to posts_path
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id)
    end


end
