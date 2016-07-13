@api_test
Feature: Stories

  @smoke
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to /projects/1655063/stories/126047279
    Then I expect Status code 200

  @smoke
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a story DELETE request to /projects/1655063/stories/126060733/
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