class UserHobby < ApplicationRecord
  belongs_to :profile
  belongs_to :hobby
  has_many :activities, as: :activityable

	after_create :create_hobby_activity

	private

	def create_hobby_activity
		user = self.profile.username
		hobby = self.hobby.name
		self.activities.create(name: "#{user} likes #{hobby}", user: self.profile.user)
	end
end
