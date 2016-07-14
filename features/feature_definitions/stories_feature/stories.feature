@api_test
Feature: Stories

  @smoke, @get
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to storiesGet endpoint for project 1655063
    Then I expect Status code 200

  @smoke, @get
  Scenario: Stories by Id GET
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to storiesIdGet endpoint for project 1655063 and story 126003425
    Then I expect Status code 200

  @smoke
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a story DELETE request to /projects/1655063/stories/126060945/
    Then I expect Status code 204

  @smoke
  Scenario: Stories POST
    Given I have set a connection to pivotal_tracker API service
    When I send a story POST request to /projects/1655063/stories/
    """
    {
       "name":"StoryPOST002"
    }
    """
    Then I expect Status code 200

@smoke
Scenario: Stories PUT
  Given I have set a connection to pivotal_tracker API service
  When I send a story PUT request to /projects/1655063/stories/126047295
    """
    {
       "name":"storyTest003(PUT_Test)"
    }
    """
  Then I expect Status code 200