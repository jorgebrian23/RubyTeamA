@api_test
Feature: Stories

  @test
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a story GET request to /projects/1655063/stories/126047279
    Then I expect Status code 200

  @test
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a story DELETE request to /projects/1655063/stories/126058981/
    Then I expect Status code 204

  @test
  Scenario: Stories POST
    Given I have set a connection to pivotal_tracker API service
    When I send a story POST request to /projects/1655063/stories/
    """
    {
       "name":"StoryPOST002"
    }
    """
    Then I expect Status code 200

@test
Scenario: Stories PUT
  Given I have set a connection to pivotal_tracker API service
  When I send a story PUT request to /projects/1655063/stories/126047295
    """
    {
       "name":"storyTest003(PUT_Test)"
    }
    """
  Then I expect Status code 200