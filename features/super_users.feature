Feature: Super users
  Scenario: Super User views all users
    Given 1 super_user
    And 1 user
    And I sign in as a super user
    When I follow "All Actions"
    Then I should see "email@example.com"
