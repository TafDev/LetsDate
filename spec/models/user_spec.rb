require 'rails_helper'

RSpec.describe User do
	describe "Account" do
		before do
			@user = create(:user)
		end

		it "should have a profile" do
			expect(@user.profile).to be_truthy
		end

		it "should have an account" do
			expect(@user.account).to be_truthy
		end
	end
end