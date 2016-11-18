class UserNotifierMailer < ApplicationMailer
	default :from => 'stewie@familyguy.com'

	# send a signup email to the user, pass in the user object that   contains the user's email address
	def send_subscription_email(user)
		@user = user
		mail( :to => @user.email,
		      :subject => 'Thank you for signing up for our premium membership, enjoy!' )
	end
end
