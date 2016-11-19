Feature: Account
  As a logged in user, i should be able to navigate to my account page
    and see premium options
    Because I want a logged in user to be able to get premium membership


  Background:
    Given I have sample users

    @poltergeist
  Scenario:
    Given I am logged in as "Barvis"
    And I visit the account page for user "Barvis"
    Then I should see "Sign up for premium today"
    And I click "Pay with Card"