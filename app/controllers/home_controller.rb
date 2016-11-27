class HomeController < ApplicationController

	before_action :authenticate_user!
	def index
		@activities = Activity.all.order(:created_at => "DESC")
	end
end
