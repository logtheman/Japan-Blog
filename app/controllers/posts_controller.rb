class PostsController < ApplicationController
  before_action :get_post, only: [:edit, :update, :destroy]
# before_action :check_auth, only: [:edit, :update, :destroy]
  #todo -
  def check_auth

  end

  def get_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    if params[:sort_by] == 'date_newest'
      @posts = @posts.sort_by_newest
    end
    if params[:sort_by] == 'date_oldest'
      @posts = @posts.order(created_at: :asc)
    end
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    end
  end

	def show
    	@post = Post.find(params[:id])
  end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
	  @post = Post.new(post_params)
    	if @post.save
      	redirect_to posts_path
#    	else
#        render 'index'
    	end
    end	

    def update
    	@post = Post.find(params[:id])

    	if @post.update(post_params)
    		redirect_to posts_path
    	else
    		render 'edit'
    	end
    end

	  def destroy
	    @post = Post.find(params[:id])
	    @post.destroy
	 
	    redirect_to posts_path
	  end

	 
  	private
  		def post_params
    		params.require(:post).permit(:title, :description, :tag_list)
  		end
  end