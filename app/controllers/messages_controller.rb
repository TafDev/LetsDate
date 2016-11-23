class MessagesController < ApplicationController

	before_action :find_conversation, only: [:create]
	def index
		@message = current_user.messages.all
	end

	def create
		message = @conversation.messages.create!(message_params)
		render :json => message
	end

	private

	def message_params
		params.permit(:body).merge(:user_id => current_user.id)
	end

	def find_conversation
		@conversation  = Conversation.find_or_create_by!(recipient_id: params[:recipient_id], sender_id: message_params[:user_id])
	end
end
