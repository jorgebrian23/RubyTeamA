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

#  @acceptance
#  Scenario: Epics verify field kind is a string
#    Given I have set a connection to pivotal_tracker API service
#    When I send a GET request epics to /projects/1655469/epics
#    Then Verify field kind is a string