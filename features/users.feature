Feature: Users

  Scenario: Sign up into the SU Campus & Environment Web App
  A user should be able to register in the SU Campus & Environment Web App
    Given I am a user who wants to register in the app
    When I visit the root page
    Then I should see a link to register
    And I submit the form
    Then I should see my profile page


  Scenario: Edit profile
  A user should be able to edit one's profile
    Given I am a user
    And I am signed in
    When I visit my profile
    Then I should see a link to edit profile
    When I change my details and I submit the form
    Then I should see my edited profile

  Scenario: Admin Login
  Admin should be able to login
    Given I am an admin
    And I am signed in
    When I visit my profile
    Then I should see admin dashboard
