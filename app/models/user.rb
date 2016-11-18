class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
            :presence => true,
            :uniqueness => {
		            :case_sensitive => false
            }
	has_one :profile, dependent: :destroy
	has_one :account, dependent: :destroy

	after_create :make_profile, :make_account

  private

	def make_profile
		self.create_profile
	end

	def make_account
		self.create_account
	end
end
