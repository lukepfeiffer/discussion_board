Feature: User
  Scenario: User Signs up
    Given I am on the home page
    And I follow "Sign In"
    And I follow "Not registered? Create an account."
    When I fill in "sign_up_email" with "new@email.com"
    And I fill in "Username" with "username"
    And I fill in "sign_up_password" with "password"
    And I fill in "sign_up_confirmation" with "password"
    And I press "Sign Up"
    Then I should be on the "/" page
    And I should see "User successfully created. We sent an email to verify your account."
    And the user should receive a confirmation email

  Scenario: User edits self
    Given 1 user
    And I sign in as a user
    When I follow "View"
    And I follow "Edit"
    And I fill in "user_username" with "FooBarBaz"
    And I press "Edit User"
    Then I should see "FooBarBaz"

  Scenario: User views user show page
    Given 1 user
    And I sign in as a user
    When I follow "View"
    Then I should see "username"
    And I should see "email@example.com"

  Scenario: User Signs In
    Given 1 user
    And I am on the home page
    And I follow "Sign In"
    When I fill in "sign_in_email" with "email@example.com"
    And I fill in "sign_in_password" with "password"
    And I press "Sign In"
    Then I should be on the "/" page
    And I should see "username"

  Scenario: User Signs out
    Given 1 user
    And I sign in as a user
    When I follow "Sign Out"
    Then I should see "Sign In"

  Scenario: User attempts to visit unauthorized page
    Given 1 user
    And I sign in as a user
    And I go to the "/admins/overview" page
    Then I should be on the "/" page
    And I should see "You do not have authorization for that action."
