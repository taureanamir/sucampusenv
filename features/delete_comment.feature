Feature: Delete Comment

  Scenario: Delete a comment
  A user should be able to delete one's comment
    Given I am a user
    And I am signed in
    Then I want to delete an existing comment
    When I visit event page
    Then I click on an event
    Then I see the event details
    When I click delete
    Then I should not see the deleted comment