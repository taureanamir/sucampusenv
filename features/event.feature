Feature: Event

  Scenario: Register for an event
  A User should be able to register for an event
    Given I am a user
    And I am signed in
    When I visit the event page
    Then I click on event I want to register
    When I click Register
    And I enter my details
    Then I should see a confirmation for registration.