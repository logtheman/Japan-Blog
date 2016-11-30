class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_post, only: [:edit, :update, :destroy]
  before_action :same_user , only: [:edit,:update,:destroy]


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
      @post.increment(:views, 1)
      @post.save
  end

	def new
		@post = Post.new
    #current_user validation
    @post.views=0
    @post.save
	end

	def edit
		@post = current_user.posts.find(params[:id])
    
    
    #current_user validation 
	end

	def create
	  @post = Post.new(post_params)
    @post.user_id = current_user.id
    	if @post.save 
        if params[:attachments].present?
          params[:attachments]['image'].each do |a|
            @attachement = @post.attachements.create!(:image => a)
          end
        end
      	redirect_to posts_path
  	end
  end	


  def update
  	@post = current_user.posts.find(params[:id])

  	if @post.update(post_params)
        if params[:attachments].present?
          params[:attachments]['image'].each do |a|
            @attachement = @post.attachements.create!(:image => a)
          end
        end


  		redirect_to post_path(@post)
  	end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end


	   private
       def get_post
        @post = Post.find(params[:id])
      end

  	private
  		def post_params
    		params.require(:post).permit(:title, :description, :tag_list, :lat, :lng, :loc_name, :image, 
          attachements_attributes: [:id, :post_id,:_destroy, :image])
  		end



  def same_user
    @post = Post.find(params[:id])
    if current_user != @post.user
        flash[:danger] = "Your are not allowed"
        redirect_to root_path
    end
  end

end
