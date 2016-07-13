@smoke_feature
Feature: Epics

  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655469/epics
    Then I expect Status code 200
  
  @acceptance
  Scenario: Epics verify field kind is a string
  	Given I have set a connection to pivotal_tracker API service
    When I send a GET request epics to /projects/1655469/epics
    Then Verify field kind is a string