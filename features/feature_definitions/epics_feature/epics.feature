@smoke_feature
Feature: Epics

  @smoke
  Scenario Outline: Epics GET
    Given I have set a connection to pivotal_tracker API service
     And create a new project ProjectAldoGET1
     And create a new epic <epic>
    When Epics I send a GET request to epics
    Then I expect Status code 200
     And Deleted a new project
    Examples:
    |epic|
    |epic_test1|
    |epic_test2|
    |epic_test3|
    |epic_test4|

  @smoke
  Scenario Outline: Epics POST
    Given I have set a connection to pivotal_tracker API service
     And create a new project ProjectAldoPOST1
    When Epics I send a POST request to epics
    """
       {"name":"<name>"}
    """
    Then I expect Status code 200
    And Deleted a new project
    Examples:
      |name|
      |epic_test1|

  @smoke
  Scenario Outline: Epics PUT
    Given I have set a connection to pivotal_tracker API service
     And create a new project ProjectAldoPOST1
    And create a new epic <epic>
    When Epics I send a PUT request to epics
    """
       {"description":"<name>"}
    """
    Then I expect Status code 200
    And Deleted a new project
    Examples:
      |name| |epic|
      |epic_test2||epic_test1|

  @smoke @development
  Scenario Outline: Epics DELETE
    Given I have set a connection to pivotal_tracker API service
    And create a new project ProjectAldoGET1
    And create a new epic <epic>
    When Epics I send a DELETE request to epics
    Then I expect Status code 204
    And Deleted a new project
    Examples:
      |epic|
      |epic_test1|

  @acceptance
  Scenario: Epics verify field id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field id is a integer

  @acceptance
  Scenario: Epics verify field kind is a string
  	Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field kind is a string

  @acceptance
  Scenario: Epics verify field created_at is a date time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field created_at is a DateTime

  @acceptance
  Scenario: Epics verify field updated_at is a date time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field updated_at is a DateTime

  @acceptance
  Scenario: Epics verify field project_id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field project_id is a integer

  @acceptance
  Scenario: Epics verify field name is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field name is a string

  @acceptance
  Scenario: Epics verify field url is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field url is a string

  @acceptance
  Scenario: Epics verify field label is a Label
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Epics Verify field label is a Label