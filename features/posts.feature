Feature: Post
  Scenario: Admin creates post
    Given the following user:
      | username | username          |
      | email    | email@example.com |
      | password | password          |
      | is_admin | true              |
    And I sign in as a user
    When I follow "Create Post"
    And I fill in "Title" with "title"
    And I fill in "post[embed_url]" with "www.google.com"
    And I fill in "Description" with "Some description"
    And I press "Create Post"
    Then I should see "title"
    And I should see "www.google.com"
    And I should see "Some description"
  Scenario: Admin deletes post
    Given the following user:
      | username | username          |
      | email    | email@example.com |
      | password | password          |
      | is_admin | true              |
    And the following post:
      | title       | title          |
      | description | description    |
      | embed_url   | www.google.com |
    And I sign in as a user
    When I follow "Delete"
    Then I should not see "title"
    And I should not see "description"
    And I should not see "www.google.com"
