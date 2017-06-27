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
