class Profile < ApplicationRecord
	belongs_to :user
	has_many :user_hobbies, dependent: :destroy
	has_many :hobbies, through: :user_hobbies

	mount_uploader :avatar, AvatarUploader

	# reverse_geocoded_by :lat, :lng
	# after_validation :reverse_geocode

	GENDER = ['male', 'female', 'transgender']

	def username
		user.username
	end
end
