Feature: Add Comment

  Scenario: Adding a comment
  A user should be able to comment on an event
    Given I am a user
    And I am signed in
    Then I want to add a comment on an exsiting event
    When I visit the event page
    Then I should see the events announced
    When I click an event
    Then I should see the event details
    When I fill in the comment box and submit it
    Then I should see the comment



