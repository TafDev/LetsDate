Feature: Comments
  As a logged in user, I want to comment on an activity
  As a logged in user, I want to comment on a post

  Background:
    Given I have sample users
    And I am logged in as "mavis"
    And I have sample post

@wip
    Scenario: User comments on activity
      Given I visit "root"
      When I click ".comment" icon
      And I fill "comment_body" with "This is wack"
      And I click "comment"
      Then I should see "This is wack"

      
    