@smoke_feature
Feature: Workspaces

  @smoke
  Scenario Outline: Workspaces POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request Workspaces to /my/workspaces
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
      | id  | kind      | name          | person_id | project_ids |
      | 300 | workspace | RecienCreado2 | 2073721   | [1655467]   |

  @smoke
  Scenario: Workspaces GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /my/workspaces
    Then I expect Status code 200

  @smoke
  Scenario: Workspaces PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to workspaces
	"""
		{
         "project_ids":[1655467,1655565]
		}
	"""
    Then I expect Status code 200


  @smoke
  Scenario: Workspaces DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send DELETE request tos workspaces
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

  @negative
  Scenario: Workspaces verify cant't be created two workspaces with the same name
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces with json
    """
		{
         "name": "Repeated"
		}
	"""
    Then I expect Status code 400

  @negative
  Scenario: Workspaces verify can't be delete a non-existing workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /my/workspaces/591523
    Then I expect Status code 404

  @negative
  Scenario: Workspaces verify can't be create a workspace with integer name
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces with json
      """
		{
         "name": 123
		}
	  """
    Then I expect Status code 400

  @negative
  Scenario Outline: Workspaces verify can't be add non-existing projects to workspace
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /my/workspaces/591525 with json
	"""
		{
         "id": <id>,
         "project_ids":<project_ids>
		}
	"""
    Then I expect Status code 400

    Examples:
      | id     | project_ids |
      | 591525 | [1666725]   |

  @negative
  Scenario: Workspaces verify can't be create a workspace within name
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces with json
      """
		{
         "name": ""
		}
	  """
    Then I expect Status code 400

  @negative
  Scenario: Workspaces verify can't be create a workspace with space before the name
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /my/workspaces with json
      """
		{
         "name": "    test"
		}
	  """
    Then I expect Status code 400







