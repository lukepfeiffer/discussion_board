Feature: User
  Scenario: User Signs up
    Given I am on the home page
    And I follow "Sign In"
    When I fill in "sign_up_email" with "new@email.com"
    And I fill in "sign_up_password" with "password"
    And I fill in "sign_up_confirmation" with "password"
    And I press "Sign Up"
    Then I should be on the "/" page
    And I should see "Signed in as new@email.com"
  Scenario: User Signs In
    Given the following user:
      | email    | new@user.com |
      | password | password      |
    And I am on the home page
    And I follow "Sign In"
    When I fill in "sign_in_email" with "new@user.com"
    And I fill in "sign_in_password" with "password"
    And I press "Sign In"
    Then I should be on the "/" page
    And I should see "Signed in as new@user.com"
  Scenario: User Signs out
