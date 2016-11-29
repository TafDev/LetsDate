class Medium < ApplicationRecord
	belongs_to :user
	has_many :likes, as: :likable
	has_many :comments, as: :commentable
	has_many :activities, as: :activityable
	mount_uploader :file_name, MediaUploader

	after_create :create_media_activity

	private

	def create_media_activity
		user = self.user.username
		self.activities.create(name: "#{user} uploaded to their image gallery", user: self.user)
	end
end
