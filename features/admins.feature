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

  Scenario: Admin creates post
    Given 1 admin
    And 1 course
    And I sign in as an admin
    When I follow "Create Post"
    And I fill in "Title" with "title"
    And I fill in "post_embed_url" with "http://google.com"
    And I fill in "Description" with "some description"
    And I press "Create Post"
    Then I should see "title"
    And I should see "description"
