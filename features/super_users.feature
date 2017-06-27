Feature: Super users
  Scenario: Super User views all users
    Given 1 super_user
    And 1 user
    And I sign in as a super user
    When I follow "All Actions"
    Then I should see "email@example.com"

  @javascript
  Scenario: Super User makes user an admin
    Given 1 super_user
    And 1 user
    And I sign in as a super user
    When I follow "All Actions"
    And I follow "Make Admin"
    Then I should not see "Make Admin"

  @javascript
  Scenario: Super User removes admin power
    Given 1 super_user
    And 1 admin
    And I sign in as a super user
    When I follow "All Actions"
    And I follow "Remove Admin"
    Then I should not see "Remove Admin"

