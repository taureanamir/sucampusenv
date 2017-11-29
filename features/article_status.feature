Feature: Users' Articles status

  Scenario: User see article status
  A User should be able to see the status of his/her submitted article either approved or rejected
    Given I am a user
    And I am signed in
    When I visit my profile page
    Then I should see a link to see my articles' status
    When I click the link my articles
    Then I should be able to see the status of article
