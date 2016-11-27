class Account < ApplicationRecord
	belongs_to :user
	has_many :activities, as: :activityable

	after_save :create_premium_activity, if: :is_premium_changed?


	private

	def create_premium_activity
		user = self.user.username
		self.activities.create(name: "#{user} just got premium", user: self.user)
	end
end
