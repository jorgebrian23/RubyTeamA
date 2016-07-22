@api_test
Feature: Stories
#Smoke
  @smokeFlow
  Scenario Outline: Stories POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request story smoke to story
    """
    {
     "name":"<name>"
    }
    """
    Then I expect Status code 200

    Examples:
      |name|
      | StoryPOST_test |

  @smokeFlow
  Scenario: Stories PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request story smoke to story
    """
    {
       "name":"storyPUT_Test003"
    }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655063/stories/126003425/
    Then I expect Status code 200

  @smokeFlow
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request story smoke to story
    Then I expect Status code 204
      And Delete project

#acceptance
  @acceptance
  Scenario: Stories: Verify if kind field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if kind field is string

  @acceptance
  Scenario: Stories: Verify if id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if id field is integer

  @acceptance
  Scenario: Stories: Verify created_at field is a Date Time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if created_at field is a DateTime

  @acceptance
  Scenario: Stories: Verify updated_at field is a Date Time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if updated_at field is a DateTime

  @acceptance
  Scenario: Stories: Verify story_type field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if story_type field is String

  @acceptance
  Scenario: Stories: Verify name field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if name field is String

  @acceptance
  Scenario: Stories: Verify current_state field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if current_state field is String

  @acceptance
  Scenario: Stories: Verify if requested_by_id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if requested_by_id field is integer

  @acceptance
  Scenario: Stories: Verify url field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if url field is String

  @acceptance
  Scenario: Stories: Verify if project_id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if project_id field is integer

  @acceptance
  Scenario Outline: Stories: POST acceptance
    Given I have set a connection to pivotal_tracker API service
    When I send a POST story request  to /projects/1655063/stories/ with json
    """
    {
     "name":"<name>"
    }
    """
    Then Story verify field name of the new story is Story_testDelete
    Then Story will be DELETE by ID

    Examples:
    |name|
    |Story_testDelete|

  @negative
  Scenario Outline: Stories: POST negative
    Given I have set a connection to pivotal_tracker API service
    When I send a negative POST story request  to /projects/1655063/stories/ with json
    """
    {
     "name":"<name>"
    }
    """
    Then I expect Status code 400
      And Story response code is invalid_parameter
      And Story response kind is error
      And Story response error is One or more request parameters was missing or invalid.
      And Story response general_problem is Name can't be blank
      And Story response validationErrorsName is name

    Examples:
      |name|
      ||