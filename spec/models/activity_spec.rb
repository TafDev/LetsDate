require 'rails_helper'

RSpec.describe Activity, type: :model do
	let(:barvis) {create(:user)}

  it "should belong to a user" do
	  expect(barvis.user_activities).to be_truthy
  end

	describe "User signs up" do
		it "creates a new activity signed up" do
			name = barvis.user_activities.first.name
			expect(barvis.user_activities.count).to eq 1
			expect(name).to eq("Barvis has just joined")
		end
	end

	describe "User chooses hobby" do
		before do
			barvis.profile.hobbies << create(:hobby)
		end
		it "create a new activity upon selecting a hobby" do
			expect(Activity.count).to eq 2
			name = barvis.user_activities.last.name
			expect(barvis.user_activities.count).to eq 2
			expect(name).to eq("Barvis likes Porn")
		end
	end

	describe "User subscribes for premium" do
		before do
			barvis.account.update(is_premium: true)
		end
		it "create new activity" do
			expect(barvis.account.is_premium).to be true
			name = barvis.user_activities.last.name
			expect(barvis.user_activities.count).to eq 2
			expect(name).to eq("Barvis just got premium")
		end
	end
end
