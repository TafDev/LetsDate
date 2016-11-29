require 'rails_helper'

RSpec.describe Comment, type: :model do
	let(:barvis) {create(:user)}

	it "should belong to a user" do
		expect(barvis.user_comments).to be_truthy
	end

	describe "User comments on activity" do
		it "creates a comment on an activity" do
			comment = barvis.user_comments.first.body
			expect(barvis.user_comments.count).to eq 1
			expect(comment).to eq("This is shit")
		end
	end
end
