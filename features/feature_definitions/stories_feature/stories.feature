@api_test
Feature: Stories
#Smoke
  @smoke
  Scenario: Stories GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655063/stories/126003425/
    Then I expect Status code 200

  @smoke
  Scenario: Stories DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1655063/stories/126436199/
    Then I expect Status code 204

  @smoke
  Scenario Outline: Stories POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655063/stories/ with json
    """
    {
     "name":"<name>"
    }
    """
    Then I expect Status code 200

    Examples:
    |name|
    | StoryPOST_002 |

  @smoke
  Scenario: Stories PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655063/stories/126047295 with json
    """
    {
       "name":"storyPUT_Test003"
    }
    """
    Then I expect Status code 200


#Acceptance
  @Acceptance, @get
  Scenario: Stories: Verify if kind field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if kind field is string

  @Acceptance, @get
  Scenario: Stories: Verify if id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if id field is integer

  @Acceptance, @get
  Scenario: Stories: Verify created_at field is a Date Time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if created_at field is a DateTime

  @Acceptance, @get
  Scenario: Stories: Verify updated_at field is a Date Time
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if updated_at field is a DateTime

  @Acceptance, @get
  Scenario: Stories: Verify story_type field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if story_type field is String

  @Acceptance, @get
  Scenario: Stories: Verify name field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if name field is String

  @Acceptance, @get
  Scenario: Stories: Verify current_state field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if current_state field is String

  @Acceptance, @get
  Scenario: Stories: Verify if requested_by_id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if requested_by_id field is integer

  @Acceptance, @get
  Scenario: Stories: Verify url field is String
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if url field is String

  @Acceptance, @get
  Scenario: Stories: Verify if project_id field is Integer
    Given I have set a connection to pivotal_tracker API service
    When I send a GET story request to /projects/1655063/stories/
    Then Story Verify if project_id field is integer