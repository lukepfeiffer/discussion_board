Feature: Comments
  Scenario: User adds comment to post
    Given the following user:
      | username | username          |
      | email    | email@example.com |
      | password | password          |
    And the following course:
      | course_code | COP3502      |
      | description | description  |
      | name        | fundamentals |
    And the following post:
      | title       | title          |
      | description | description    |
      | embed_url   | www.google.com |
      | course_id   | 1              |
      | user_id     | 1              |
    And I am on the "/posts/1" page
    When I fill in "comment[body]" with "Some text"
    And I press "Post Comment"
    Then I should see "Some text"
