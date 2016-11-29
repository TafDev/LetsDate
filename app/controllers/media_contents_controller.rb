class MediaContentsController < ApplicationController
	def show
		@user = User.find(params[:id])
		@images = @user.media.all
		@comment = Comment.new
	end

	def create
		@media = current_user.media.new(file_name: params[:file])
		if @media.save!
			respond_to do |format|
				format.json{render json: @media}
			end
		end
	end
end
