class CommentsController < ApplicationController
	def create
		comment = current_user.user_comments.create(comment_params)
		render json: comment
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_type, :commentable_id)
	end
end
