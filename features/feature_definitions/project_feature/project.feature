@smoke_feature
Feature: Project

  @smoke
  Scenario: Project POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request project smoke to /projects with json
    """
       {"name":"alvaroPOST10"}
    """
    Then I expect Status code 200

  @smoke
  Scenario: Project PUT
    Given I have set a connection to pivotal_tracker API service

    When i will send a PUT to request to project whit json
    """
       {"name":"alvaroPut10"}
    """
    Then I expect Status code 200

  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
    When I will send a GET request to projects
    Then I expect Status code 200

  @smoke
  Scenario: Project DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send DELETE request to projects
    Then I expect Status code 204

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
    When I send a POST request project and deleted to /projects with json
    """
    {
      "name":"<name>"
    }
    """
    Then Project Verify field name of the new project is testDelete1
    Then Project will be DELETE by ID

    Examples:
      | name        |
      | testDelete1 |

  @negative
  Scenario: Verify if the user can not create a project whit out name
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request project to /projects with json
    """
    {
      "name":""
    }
    """
    Then Project in post Verify if the spect status is 400
    And Project in post Verify field kind is error
    And Project in post Verify field Code is invalid_parameter
    And Project in post Verify field error is One or more request parameters was missing or invalid.
    And Project in post Verify field general_problem is unless create_sample is true, this endpoint requires the parameter: name

  @negative
  Scenario: Verify if the start date accept the start date value in lower case
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request project to /projects/1657503 with json
    """
    {
      "week_start_day":"tuesday"
    }
    """
    Then Project Verify if the spect status is 400
    And Project Verify field kind is error
    And Project Verify field Code is invalid_parameter
    And Project Verify field error is One or more request parameters was missing or invalid.
    And Project Verify field requirement is The 'week_start_day' parameter value was '"tuesday"' but must be one of the value(s):  'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'




#


























