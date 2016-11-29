class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :user_comments
end
