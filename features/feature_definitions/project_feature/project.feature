@smoke_feature
Feature: Project

  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1657475
    Then I expect Status code 200
  @smoke
  Scenario: Project PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1657475 with json
    """
       {"name":"albaco renovado"}
    """
    Then I expect Status code 200

  @smoke
  Scenario: Project DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1657475
    Then I expect Status code 204

  @smoke
  Scenario Outline: Project POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects with json
    """
       {"name":"<name>"}
    """
    Then I expect Status code 200

    Examples:
      |name|
      |albaco1|

  @acceptance
  Scenario: checks whether the field is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to /projects
    Then Verify if the field is a string
  @acceptance
  Scenario: checks whether the name to send updated successfully
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request project to /projects/1657475
    """
    {"name":"projectNameAlvaro"}
    """
    Then Verify if the field is a string projectNameAlvaro