Feature: Like
  As a logged in user I want to like things (an activity)

  Background:
    Given I have sample users
    And User sign_in_count is 2

    @wip
#      @poltergeist
    Scenario: I like an activity
      Given I am logged in as "Barvis"
      And I visit "root"
      When I click "#activity-157" icon
      Then The number of likes should increase by 1
