class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
            :presence => true,
            :uniqueness => {
		            :case_sensitive => false
            }
	has_one :profile, dependent: :destroy
	has_one :account, dependent: :destroy
  has_many :conversations
  has_many :messages, through: :conversations

  has_many :activities, as: :activityable
  has_many :user_activities, class_name: "Activity", foreign_key: :user_id, inverse_of: :user

	after_create :make_profile, :make_account, :create_new_user_activity

  def my_conversations
	  Conversation.where('conversations.sender_id =? OR conversations.recipient_id =?', self.id, self.id)
  end

  private

	def make_profile
		self.create_profile
	end

	def make_account
		self.create_account
	end

	def create_new_user_activity
		self.activities.create!(name: "#{self.username} has just joined", user: self)
	end
end
