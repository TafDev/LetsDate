 require 'pry'
Given(/^I am logged in as "([^"]+)"$/) do |username|
	log_on_as(username)
	binding.pry
end

When(/^I visit "([^"]+)"$/) do |page|
	visit get_named_route(page)
end

When(/^I click "([^"]+)"$/) do |text|
	click(text)
end

Then(/^I should see "([^"]*)"$/) do |content|
	expect(page.body).to match(content)
end
