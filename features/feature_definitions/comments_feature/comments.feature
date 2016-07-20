@api_test
Feature: Feature Comments

  @smoke
  Scenario: Me Comments
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655507/stories/126056769/comments
    Then I expect Status code 200

  @smoke
  Scenario: Me Comments
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655507/stories/126056769/comments with json
    """
    {
    "text":"This is a post of Juana"
    }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Me Comments
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1655507/stories/126056769/comments/143574185
    Then I expect Status code 204

  @smoke
  Scenario: Me Comments
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655507/stories/126056769/comments/143586413 with json
    """
      {
         "text": "This is a  pap"
      }
    """
    Then I expect Status code 200

  @acceptance
  Scenario: Comments verify field kind is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify field kind is a string in comments

  @acceptance
  Scenario: Comments verify field id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify if the field id is a integer

  @acceptance
  Scenario: Comments verify field story_id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify if the field story_id is a integer

  @acceptance
  Scenario: Comments verify field text is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify field text is a string in comments

  @acceptance
  Scenario: Comments verify field person_id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify if the field person_id is a integer

  @acceptance
  Scenario: Comments verify field created_at is a date time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify if the field created_at is a date time

  @acceptance
  Scenario: Comments verify field updated_at is a date time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request comments to /projects/1655507/stories/126056769/comments
    Then Verify if the field updated_at is a date time

  @negative
  Scenario: Comments verify field text is empty
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655507/stories/126056769/comments with json
    """
    {
    "text":""
    }
    """
    Then I expect Status code 400

  @negative
  Scenario: Comments verify field text don't accept blank spaces
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655507/stories/126056769/comments with json
    """
    {
    "text":"   "
    }
    """
    Then I expect Status code 400

  @negative
  Scenario: Comments verify that don't can deleted a comment that don't exist
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1655507/stories/126056769/comments/1435741859
    Then I expect Status code 400

  @negative
  Scenario: Comments verify that don't can edited a comment that don't exist
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655507/stories/126056769/comments/143574178859 with json
    """
      {
         "text": "This is a negative test"
      }
    """
    Then I expect Status code 400

  @negative
  Scenario: Comments verify that don't can edit a comment for empty comment
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655507/stories/126056769/comments/143586413 with json
    """
      {
         "text": ""
      }
    """
    Then I expect Status code 400

  @negative
  Scenario: Comments verify that don't can edit a comment for blank spaces
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655507/stories/126056769/comments/143586413 with json
    """
      {
         "text": "      "
      }
    """
    Then I expect Status code 400

    @negative
    Scenario: Comments verify that don't can edit a comment for empty comments and validated of error
      Given I have set a connection to pivotal_tracker API service
      When I send a negative POST request comments to /projects/1655507/stories/126056769/comments with json
      """
      {
          "text":""
      }
      """
      Then I expect Status code 400

      Then Comments in post verify field code is invalid_parameter
      Then Comments in post verify field kind is error


