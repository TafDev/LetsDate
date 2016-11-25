class Conversation < ApplicationRecord
	belongs_to :sender, class_name: "User", foreign_key: :sender_id
	belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
	has_many :messages, dependent: :destroy

	accepts_nested_attributes_for :messages

	validates_uniqueness_of :sender_id, :scope => :recipient_id

	def counterpart(current_user)
		 self.recipient == current_user ? self.sender : self.recipient
	end

	scope :between, -> (sender_id, recipient_id) do
		where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)",
		      sender_id,recipient_id, recipient_id, sender_id)
	end

	# def self.between(sender_id, recipient_id)
	# 	self.where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)",
	# 			sender_id,recipient_id, recipient_id, sender_id)
	# end
end
