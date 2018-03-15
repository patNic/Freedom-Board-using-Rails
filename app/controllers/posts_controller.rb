class PostsController < ApplicationController
	@@inside_find = 1
	@@result = ""
	def index
		
		if @@inside_find == 0
			@posts = Post.where("post_content like ? OR sender like ?", "%#{@@result}%", "%#{@@result}%")
		else
			@posts = Post.all
		end
		
		@@inside_find = 1
	end
	
	def find_post
		@post_to_be_found = params[:findpost]
		
		@post_to_be_found.each do |k,v|
			@@result = v
		end
		
		@@inside_find = 0
		redirect_to action: "index"
		
	end
	
	def all_posts
		redirect_to action: "index"
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
