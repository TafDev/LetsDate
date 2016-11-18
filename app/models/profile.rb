class Profile < ApplicationRecord
	belongs_to :user
	has_many :user_hobbies, dependent: :destroy
	has_many :hobbies, through: :user_hobbies

	mount_uploader :avatar, AvatarUploader

	GENDER = ['male', 'female', 'transgender']
end
