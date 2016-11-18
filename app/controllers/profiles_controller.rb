class ProfilesController < ApplicationController

	before_action :validate_user_exist

	def show
		@profile = @user.profile
		@hobby = @profile.hobbies.new
	end


	def update
		@profile = current_user.profile
		if params.include?(:hobby)
			if params[:hobby][:name]
				arr = params[:hobby][:name].split(",").map(&:strip)
				hobbies = arr.inject([]) do |hobbies, hobby_name|
					hobby = Hobby.find_or_create_by!(name: hobby_name)
					@profile.user_hobbies.create!(hobby: hobby)
					hobbies << hobby
				end
				render json: {hobbies: hobbies}
			end
		else
			@profile.update(profile_params)
			if remotipart_submitted?
				render json: @profile
			else
				render json: @profile
			end
		end
	end

	def destroy
		@hobby = current_user.profile.user_hobbies.find_by(:hobby_id => params[:id])
		@hobby.destroy
		render json: @hobby
	end

	private

	def validate_user_exist
		@user = User.find(params[:user_id])
	end

	def profile_params
		params.require(:profile).permit(:avatar, :sex, :age)
	end
end
