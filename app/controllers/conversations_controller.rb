class ConversationsController < ApplicationController

	def index
		@my_conversations = current_user.my_conversations.order("created_at DESC")
		# @conversation = Conversation.find(id: params[:id])
		@message = Message.new
		# @recipient = @conversation.counterpart(current_user)
		@my_message = Message.new

	end

	def show
		# binding.pry
# 		@conversation = Conversation.find_by_sql("SELECT c.*, m.body, u.username
# FROM conversations AS c
# 	INNER JOIN messages AS m ON m.conversation_id = c.id
#   INNER JOIN users AS u ON m.user_id= u.id
# WHERE c.id = #{params[:id]};")

		@conversation = Conversation.find_by(id: params[:id])
		# @recipient = @conversation.counterpart(current_user)

		# @new_message = @conversation.messages.new
		# response = @conversation.messages.all.order('created_at DESC')
		# render json: @conversation, only: [:username, :body]
		respond_to do |format|
			# binding.pry
			format.js
		end
	end


	private
	def conversation_params
		params.require(:message).permit(:body, :sender_id, :conversation_id)
	end
end
