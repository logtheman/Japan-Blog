class LikesController < ApplicationController

  respond_to :js

  def like
    @user = current_user
    @post = Post.find(params[:post_id])
    @user = @user.likes.create!(post_id: @post.id)
  end

  def unlike
    @user = current_user
    @like = @user.likes.find_by_post_id(params[:post_id])
    @post = Post.find(params[:post_id])
    @like.destroy
  end



    def create

    end

    def show

    end

    def destroy


    end

    def update


    end

    def edit
   
    end

      private
        def attachement_params
   #       params.require(:attachement).permit(:image)
        end

end