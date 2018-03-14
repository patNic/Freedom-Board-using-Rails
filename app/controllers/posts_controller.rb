class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def new
	
	end
	
	def show
		@post = Post.find(params[:id])
		redirect_to action: "index"
	end
	def create
		#render plain: params[:post].inspect
		@post = Post.new(post_params)
		
		@post.save!
		redirect_to @post
	end
	private def post_params
		params.require(:post).permit(:post_content, :sender)
	end
end
