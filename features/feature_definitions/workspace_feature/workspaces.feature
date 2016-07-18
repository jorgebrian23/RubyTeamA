@smoke_feature
Feature: Workspaces

  @smoke
  Scenario: Workspaces GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /my/workspaces
    Then I expect Status code 200

  @smoke
  Scenario Outline: Workspaces POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces with json
	"""
		{
         "id": <id>,
         "kind": "<kind>",
         "name": "<name>",
         "person_id": <person_id>,
         "project_ids":<project_ids>
		}
	"""
    Then I expect Status code 200

    Examples:
      | id  | kind      | name         | person_id | project_ids |
      | 300 | workspace | RecienCreado | 2073721   | [1655467]   |


  @smoke
  Scenario Outline: Workspaces PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /my/workspaces/591557 with json
	"""
		{
         "id": <id>,
         "project_ids":<project_ids>
		}
	"""
    Then I expect Status code 200

    Examples:
      | id     | project_ids       |
      | 591557 | [1655467,1655565] |


  @smoke
  Scenario: Workspaces DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /my/workspaces/591523
    Then I expect Status code 204

  @acceptance
  Scenario: Workspaces verify field kind is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request Workspaces to /my/workspaces
    Then Workspaces Verify field kind is a string

  @acceptance
  Scenario: Workspaces verify field id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request Workspaces to /my/workspaces
    Then Workspaces Verify field id is a integer

  @acceptance
  Scenario: Workspaces verify field name is a string
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request Workspaces to /my/workspaces
    Then Workspaces Verify field name is a string

  @acceptance
  Scenario: Workspaces verify field person_id is a integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request Workspaces to /my/workspaces
    Then Workspaces Verify field person_id is a integer

  @acceptance
  Scenario: Workspaces verify field project_ids is a array
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request Workspaces to /my/workspaces
    Then Workspaces Verify field project_ids is a array