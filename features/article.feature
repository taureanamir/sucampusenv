Feature: Article

  Scenario: Submit an article
  A User should be able to submit an article
    Given I am a user
    And I am signed in
    Then I want to add an article
    When I visit the article page
    Then I should see a link to submit an article
    Then I should see a list of articles if exists
    When I click the submit article link
    Then I should be able to fill in the title and content
    When I submit the article
    Then I should see a confirmation for submission.

  Scenario: See status of an article
  A user should be able to see status of his/her article
    Given I am a user
    And I am signed in
    And I submit an article
    When I visit my articles page
    Then I should see the status of my article


  Scenario: Admin should be able to see the list of articles
  An admin should be able to see all the articles
    Given I am an admin
    And I am signed in
    When I go to the list of all articles page
    Then I should see all the articles submitted by the users

  Scenario: Admin should be able approve articles
  An admin should be able to approve the articles submitted by the users
    Given I am an admin
    And I am signed in
    When I go to the list of all articles page
    Then I should see all the articles submitted by the users
    When I review an article
    Then I should be able to approve or reject it
    When I click approve I should be able to get the approval notice
    And when I click reject I should be able to get the reject notice