Feature: Post
  Scenario: Admin creates post
    Given 1 admin
    And 1 course
    And I sign in as an admin
    When I follow "Create Post"
    And I fill in "Title" with "title"
    And I fill in "post[embed_url]" with "www.google.com"
    And I press "Create Post"
    Then I should see "title"
    And I should see "www.google.com"

  Scenario: Admin deletes post
    Given 1 admin
    And 1 course
    And that course has 1 post
    And that post belongs to that user
    And I sign in as an admin
    When I follow "Delete"
    Then I should not see "title"
    And I should not see "description"
    And I should not see "www.google.com"

  Scenario: Admin edits post
    Given 1 admin
    And 1 course
    And that course has 1 post
    And that post belongs to that user
    And I sign in as an admin
    And I follow "Edit"
    When I fill in "post_title" with "FooBar"
    And I fill in "post_embed_url" with "Baz"
    And I press "Edit Post"
    Then I should see "FooBar"
    And I should see "Baz"

  Scenario: User searches for posts
    Given I am on the root path
    And 1 course
    And that course has 2 posts
    When I fill in "search" with "title"
    And I press "Search"
    Then I should see "title"
