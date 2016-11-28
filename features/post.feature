Feature: Post
  As a logged in user, I want to write a post on my profile
  As a logged in user, I want to save my post
  As a logged in user, I want my post to appear on feeds
  As a logged in user, I want to remove my post

  Background:
    Given I have sample users

  Scenario: User creates a post
    Given I am logged in as "Barvis"
    And I visit "root"
      And I click "Complete my Profile"
      And I visit the profile page for user "Barvis"
    When I fill "post_body" with "This is my first post"
    And I click "Create Post"
      Then I have a new post

    Scenario: User view their post
      Given I am logged in as "Barvis"
      And I have sample posts
      When I visit the profile page for user "Barvis"
      Then I should see "This is my first post"
      


    