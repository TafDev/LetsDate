Given(/^I have sample users$/) do
	@barvis = User.create(username: "Barvis", email: "barvis@test.com", password: "123456")
	@mavis = User.create(username: "mavis", email: "mavis@test.com", password: "123456")
end

When(/^I visit the account page for user "([^"]+)"$/) do |username|
	user = User.find_by(username: username)
	visit get_named_route("user_account", user)
end