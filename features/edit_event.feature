Feature: Edit event

  Scenario: Editing an existing event
  Admin should be able to edit an existing event
    Given I am an admin
    And I am signed in
    When I visit my profile
    Then I should see admin dashboard
    When I click edit event
    Then I should see list of events
    When I click the event
    Then I should see edit button
    When I click the edit button
    Then I should be able to edit the event
    When I click update
    Then I should see the edited event details