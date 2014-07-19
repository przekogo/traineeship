class PostsController < ApplicationController

	def index
		@posts=Post.all
	end
	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def new
		@post=Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to users_path, notice: 'Dodano post'
		else
			render 'new'
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update(user_params)
			redirect_to posts_path, notice: 'Zaktualizowano'
		else
			render 'edit'
		end
	end	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, notice: 'Usunieto'
	end


	private
		def post_params
			params.require(:post).permit(:title, :content)
		end
end