Feature: Comments

  Scenario: User adds comment to post
    Given 1 user
    And 1 course
    And that course has 1 post
    And that post belongs to that user
    And I sign in as a user
    And I am on a show post page
    When I fill in "comment_body" with "Some text"
    And I press "Post Comment"
    Then I should see "Some text"