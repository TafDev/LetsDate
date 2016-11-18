class Hobby < ApplicationRecord
	has_many :user_hobbies
	has_many :profiles, through: :user_hobbies
end
