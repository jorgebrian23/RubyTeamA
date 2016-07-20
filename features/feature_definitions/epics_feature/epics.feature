@smoke_feature
Feature: Epics

  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
     And create a new project ProjectAldoBV
    When I send a GET request to /projects/1655469/epics
    Then I expect Status code 200

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