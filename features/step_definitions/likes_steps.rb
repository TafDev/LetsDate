When(/^I click "([^"]*)" icon$/) do |id|
	find(id).click
end

Given(/^User sign_in_count is (\d+)$/) do |number|
	user = User.find_by(username: "Barvis")
	user.sign_in_count = 2
	expect(user.sign_in_count).to eq number.to_i
end


Then(/^The number of likes should increase by (\d+)$/) do |number|
	pending
end

