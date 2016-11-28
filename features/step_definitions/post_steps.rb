Then(/^I have a new post$/) do
	expect(@barvis.posts.count).to eq 1
end

Given(/^I have sample posts$/) do
	@post1 = @barvis.posts.create(:body => "This is my first post")
	@post2 = @barvis.posts.create(:body => "This is my second post")
end

