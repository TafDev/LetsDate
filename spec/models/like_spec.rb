require 'rails_helper'

RSpec.describe Like, type: :model do
	let(:barvis) {create(:user)}
	it "should belong to a user" do
		expect(barvis.user_likes).to be_truthy
	end
end
