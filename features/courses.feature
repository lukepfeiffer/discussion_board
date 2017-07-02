Feature: Courses
  Scenario: User views recent posts
    Given 1 user
    And 1 course
    And I sign in as a user
    When I visit the course show page
    Then I should see "course"
    And I should see "cop3502"
    And I should see "description"
