Feature: Delete event

  Scenario: Delete an event
  An admin should be able to delete an event
    Given I am an admin
    And I am signed in
    When I visit the event page
    Then I want see the event list
    When I click on an event that i want to delete
    Then I see the event information
    When I click delete button
    Then I should not see the deleted event