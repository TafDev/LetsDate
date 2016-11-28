Feature: Messaging System
  As a logged in user i want to visit a user page and be able to message them directly
  As a logged in user i want to be able to see all the conversations i am currently having
  As a logged in user i want to view into a conversation and see all exchanged messages
  As a logged in user i want to compose or reply messages on conversation page

  Background:
    Given I have sample users

      @poltergeist
    Scenario: I can view the form, enter content and click send
      Given I am logged in as "Barvis"
      And I visit the profile page for user "mavis"
      When I click "Message me"
      And I fill "message_body" with "Hi mavis let's chat"
      Then I click "Send"

    Scenario: I can view all my conversations
      Given I am logged in as "Barvis"
       And I visit "root"
      When I click "My messages"
      Then I should see "All my Conversations"
      