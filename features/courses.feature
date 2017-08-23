Feature: Courses
  Scenario: Admin creates course
    Given 1 admin
    And I sign in as an admin
    When I follow "Create Course"
    And I fill in "Name" with "Foo"
    And I fill in "course_course_code" with "Baz"
    And I press "Create Course"
    Then I should see "Course was created!"

  Scenario: User views course show page
    Given 1 user
    And 1 course
    And I sign in as a user
    When I visit the course show page
    Then I should see "course"
    And I should see "cop3502"
    And I should see "description"
    And I should not see "Edit"

  Scenario: Admin edits course
    Given 1 admin
    And 1 course
    And I sign in as an admin
    When I visit the course show page
    And I follow "Edit"
    And I fill in "course_name" with "FooBarBaz"
    And I fill in "course_course_code" with "FOO2020"
    And I press "Edit Course"
    Then I should see "FooBarBaz"
    And I should see "FOO2020"
    And I should see "Course was updated!"
