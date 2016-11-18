class UserHobby < ApplicationRecord
  belongs_to :profile
  belongs_to :hobby
end
