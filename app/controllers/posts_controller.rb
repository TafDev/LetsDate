class PostsController < ApplicationController
	def create
		post = current_user.posts.create!(post_params)
	end

	private

	def post_params
		params.require(:post).permit(:body)
	end
end
