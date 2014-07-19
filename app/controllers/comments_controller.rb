class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to posts_path, notice: 'Dodano komentarz'
		else
			puts @comment.post
			redirect_to posts_path
		end
	end





	private
		def comment_params
			params.require(:comment).permit(:post_id, :content)
		end
end	