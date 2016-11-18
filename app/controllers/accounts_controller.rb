class AccountsController < ApplicationController

	before_action :authenticate_user!

  def show
  end

  def update
		token = params[:stripeToken]
		subscriber = Stripe::Customer.create(
																		 card: token,
																		 plan: 1,
		                                 email: current_user.email
		)
		# binding.pry
		current_user.account.is_premium = true
		current_user.account.stripeid = subscriber.id
		current_user.account.save

		redirect_to user_profile_path
  end
end
