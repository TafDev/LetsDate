When(/^I visit the profile page for user "([^"]+)"$/) do |username|
	user = User.find_by(username: username)
	visit get_named_route("user_profile", user)
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field, content|
	fill_in(field, :with => content)
end
