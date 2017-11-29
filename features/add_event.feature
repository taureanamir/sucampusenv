Feature: Add event

  Scenario: Admin add an event
  Admin should be able to add a new event
    Given I am an admin
    And I am signed in
    When I visit my profile
    Then I should see admin dashboard
    When I click add new event
    Then I should the form for event
    And I should fill the details for the event
    When I submit the form for
    Then I should be able see the new event details