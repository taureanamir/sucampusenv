Feature: Ban and unban a user

  Scenario: Admin is banning and unbanning users
  Admin should be able to ban or unban a users
    Given I am an admin
    And I am signed in
    When I visit my profile
    Then I should see admin dashboard
    When I click user details
    Then I should see a list of users
    When I click ban a user
    Then I should see the status of ban user
    When I click unban status of the user
    Then I shoud be able to see the user status changed