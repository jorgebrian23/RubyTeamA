Feature: Workflow
 @workflow
 Scenario: Create Project
   Given I have set a connection to pivotal_tracker API service
   When I want create a new project whit POST to the workflow in /projects
   """
   {"name":"workFlow10"}
   """
   Then I expect Status code 200

   @workflow
   Scenario: Create Story
     Given I have set a connection to pivotal_tracker API service
     When I want create a new story whit POST to the workflow in /stories
     """
     {"name":"story_workflow"}
     """
     Then I expect Status code 200

  @workflow
  Scenario: GET Story
    Given I have set a connection to pivotal_tracker API service
    When I send a GET Stories to the workflow
    Then I expect Status code 200

  @workflow
  Scenario: Create Epics
    Given I have set a connection to pivotal_tracker API service
    When I want create a new epics whit POST to the workflow in /epics
     """
     {"name":"epics_workflow"}
     """
    Then I expect Status code 200
  @workflow
  Scenario: GET Epics
    Given I have set a connection to pivotal_tracker API service
    When I send a GET epics to the workflow
    Then I expect Status code 200

  Scenario: Update Epics
    Given I have set a connection to pivotal_tracker API service
    When I want create a new epics whit PUT to the workflow in /epics
     """
     {"description":"epics_workflow_update"}
     """
    Then I expect Status code 200

  @workflow
  Scenario: Create comments
    Given I have set a connection to pivotal_tracker API service
    When I want create a new comments whit POST to the workflow in /comments
     """
     {"text":"comments_workflow"}
     """
    Then I expect Status code 200

  @workflow
  Scenario: GET Comments
    Given I have set a connection to pivotal_tracker API service
    When I send a GET comments to the workflow
    Then I expect Status code 200

  @workflow
  Scenario: Create workspace
    Given I have set a connection to pivotal_tracker API service
    When I want create a new workspaces whit POST to the workflow in my/workspaces
     """
     {"name":"newWork2"}
     """
    Then I expect Status code 200

  @workflow
  Scenario: GET Workspaces
    Given I have set a connection to pivotal_tracker API service
    When I send a GET workspaces to the workflow
    Then I expect Status code 200

  @workflow
  Scenario: Edit Project
    Given I have set a connection to pivotal_tracker API service
    When I want edit my project whit PUT to the workflow in /projects
   """
   {"name":"workFlow16"}
   """
    Then I expect Status code 200


   @workflow
     Scenario Outline: Edit Story
     Given I have set a connection to pivotal_tracker API service
     When I want edit my story whit PUT
     """
     {"name":"<name>"}
     """
     Then I expect Status code 200
     Examples:
     |name|
     |PUT_update|




  @workflow
  Scenario: Edit comments
    Given I have set a connection to pivotal_tracker API service
    When I edit comments whit PUT
   """
   {"text":"comments edited"}
   """
    Then I expect Status code 200
  #    deleted comments
  @workflow
  Scenario: Deleted comments
    Given I have set a connection to pivotal_tracker API service
    When I deleted comments whit DELETE
    Then I expect Status code 204
  @workflow
  Scenario: Edit Workspaces
    Given I have set a connection to pivotal_tracker API service
    When I want edit my workspaces whit PUT to the workflow in my/workspaces
    Then I expect Status code 200

  @workflow
  Scenario: GET Projects
    Given I have set a connection to pivotal_tracker API service
    When I want send a GET to /projects to the workflow
    Then I expect Status code 200




  @workflow
  Scenario: Delete workspace
    Given I have set a connection to pivotal_tracker API service
    When I want DELETE the workspace
    Then I expect Status code 204

  @workflow
  Scenario: Delete project
    Given I have set a connection to pivotal_tracker API service
    When I want DELETE the project
    Then I expect Status code 204