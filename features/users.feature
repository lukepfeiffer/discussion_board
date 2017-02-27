Feature: User
  Scenario: User Signs up
    Given I am on the home page
    And I follow "Sign In"
    When I fill in "sign_up_email" with "new@email.com"
    And I fill in "Username" with "username"
    And I fill in "sign_up_password" with "password"
    And I fill in "sign_up_confirmation" with "password"
    And I press "Sign Up"
    Then I should be on the "/" page
    And I should see "Signed in as username"
  Scenario: User Signs In
    Given the following user:
      | username | username     |
      | email    | new@user.com |
      | password | password     |
    And I am on the home page
    And I follow "Sign In"
    When I fill in "sign_in_email" with "new@user.com"
    And I fill in "sign_in_password" with "password"
    And I press "Sign In"
    Then I should be on the "/" page
    And I should see "Signed in as username"
  Scenario: User Signs out
    Given the following user:
      | email    | email@example.com |
      | password | password          |
    And I sign in as a user
    When I follow "Sign Out"
    Then I should see "Sign In"
