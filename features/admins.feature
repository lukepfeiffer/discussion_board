Feature: Admins
 Scenario: Admin views recent posts
    Given 1 admin
    And 1 course
    And that admin has 1 post
    And that post belongs to that course
    And I sign in as an admin
    When I follow "All Actions"
    Then I should see "title"

  Scenario: Admin views all courses
    Given 1 admin
    And 1 course
    And I sign in as an admin
    When I follow "All Actions"
    Then I should be on the "/admins/overview" page
    And I should see "cop3502"

  Scenario: Admin views all courses
    Given 1 admin
    And 1 course
    And that course has 1 post
    And I sign in as an admin
    When I follow "All Actions"
    Then I should be on the "/admins/overview" page
    And I should see "title"

  Scenario: Admin creates course
    Given 1 admin
    And I sign in as an admin
    When I follow "Create Course"
    And I fill in "Name" with "Foo"
    And I fill in "course_course_code" with "Baz"
    And I press "Create Course"
    Then I should see "The course was successfully created!"
