@smoke_feature
Feature: Project



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





  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to projects/1654555
    Then I expect Status code 200

  @acceptance
  Scenario: Project verify if the field id is an integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field id in projects is a integer

  @acceptance
  Scenario: Project verify if the field name is an string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field name in projects is a string


  @acceptance
  Scenario: Project verify if the field kind is an string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field kind in projects is a string

  @acceptance
  Scenario: Project verify if the field iteration_length is an integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field iteration_length in projects is a integer

  @acceptance
  Scenario: Project verify if the field version is an integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field version in projects is a integer
  @acceptance
  Scenario: Project verify if the field week_start_day is an string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field week_start_day in projects is a string

  @acceptance
  Scenario: Project verify if the field point_scale is an integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request project to projects/
    Then Project Verify field point_scale in projects is a integer



  @acceptance
  Scenario: checks whether the name to send updated successfully
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request project to /projects/1654555 whit json
    """
      { "name":"alvaroAcceptanceTest" }
    """
    Then Project Verify field name of project is alvaroAcceptanceTest

  @acceptance
  Scenario Outline: Project POST
   Given I have set a connection to pivotal_tracker API service
   When I send a POST request project to /projects with json
    """
    {
      "name":"<name>"
    }
    """
    Then Project Verify field name of the new project is testDelete1
    Then Project will be DELETE by ID

  Examples:
      |name|
      |testDelete1|

































