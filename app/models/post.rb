class Post < ApplicationRecord
  belongs_to :user

  has_many :activities, as: :activityable

  after_create :create_post_activity

  private

  def create_post_activity
	  user = self.user.username
	  post = self.body
	  self.activities.create(name: "#{user} said #{post}", user: self.user)
  end
end
