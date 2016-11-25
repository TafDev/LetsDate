class MessagesController < ApplicationController

	# before_action :find_or_create_conversation, only: [:create]
	# before_action :find_conversations, only: [:create]
	def index
		@conversation = Conversation.between(message_params[:user_id], params[:recipient_id]).first
		# @messages = @conversation.messages.all
		@recipient = @conversation.counterpart(current_user)
	end

	def create
		if params[:message].include? "conversation_id"
			find_conversations
			my_message = @my_conversation.messages.create!(message_params)
			render :json => my_message
		else
			find_or_create_conversation
			new_params = message_params.to_h.merge(conversation_id: @conversation.id)
			new_params.delete :recipient_id
			message = @conversation.messages.create(new_params)
			render :json => message
		end
	end

	private

	def find_conversations
		@my_conversation = Conversation.find(params[:message][:conversation_id])
	end

	def message_params
		params.require(:message).permit(:body, :recipient_id).merge(:user_id => current_user.id)
		# params.require(:message).permit(:body, :user_id)
	end

	def find_or_create_conversation
		binding.pry

		@conversation = Conversation.between(message_params[:user_id], message_params[:recipient_id]).first
		unless @conversation
			@conversation = Conversation.create!(recipient_id: message_params[:recipient_id], sender_id: message_params[:user_id])
		end
	end
end
# if params[:recipient_id].nil?
# 	params[:recipient_id] = @conversation.counterpart(current_user)
# end