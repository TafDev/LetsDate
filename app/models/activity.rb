class Activity < ApplicationRecord
	belongs_to :activityable, polymorphic: true
	belongs_to :user, inverse_of: :user_activities
	has_many :likes, as: :likable
end
