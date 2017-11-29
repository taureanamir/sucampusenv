Feature: Users statistics

  Scenario: Admin wants to see users statistics
  Admin should be able to see recently registered and signed in users
    Given I am an admin
    And I am signed in
    When I visit my profile
    Then I should see admin dashboard
    When I click user details
    Then I should be able to see a recently registered and singed in users
