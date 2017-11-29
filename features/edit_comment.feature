Feature: Edit Comment

  Scenario: Editing a comment
  A user should be able to edit one's comment
    Given I am a user
    And I am signed in
    Then I want to edit an existing comment
    When I visit event page
    Then I click on an event
    Then I see the event details
    When I click edit
    Then I should see the editable text
    When I edit comment and save changes
    Then I should see the edited comment