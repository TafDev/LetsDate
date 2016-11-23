class ConversationsController < ApplicationController

	def index
		@my_conversations = current_user.my_conversations.all.order('created_at DESC')
		@message = Message.new
	end
end
