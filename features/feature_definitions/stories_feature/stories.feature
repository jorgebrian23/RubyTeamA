@api_test
Feature: Stories
#Smoke
  @smoke
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655063/stories/126003425/
    Then I expect Status code 200

  @smoke
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1655063/stories/126429949/
    Then I expect Status code 204

  @smoke
  Scenario Outline: Stories POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655063/stories/ with json
    """
    {
     "name":"<name>"
    }
    """
    Then I expect Status code 200

    Examples:
    |name|
    | StoryPOST_002 |

  @smoke
  Scenario: Stories PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655063/stories/126047295 with json
    """
    {
       "name":"storyPUT_Test003"
    }
    """
    Then I expect Status code 200

#Acceptance
  @acceptance, @get
  Scenario: Stories GET acceptance
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to storiesGet endpoint for project 1655063
    Then Verify if the name field is string
    #Then I expect Status code 200


  @acceptance, @get
  Scenario: Stories by Id GET acceptance
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to storiesIdGet endpoint for project 1655063 and story 126003425
    Then I expect Status code 200