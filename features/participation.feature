Feature: Participation

  Scenario: Admin should see the list of participants
  Admin should be able to get the list of participants for an event
    Given I am an admin
    And I am signed in
    When I visit the participants list page
    Then I select an event from the dropdown
    When I click go
    Then I should see the list of participants



