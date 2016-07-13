@smoke_feature
Feature: Comments

  @smoke
  Scenario: Comments GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1655469/stories/126047265/comments
    Then I expect Status code 200

  @smoke
  Scenario Outline: Comments POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1655469/stories/126047265/comments with json
	"""
		{
		  "created_at": "<create_at>",
         "id": <id>,
         "kind": "<kind>",
         "person_id": <person_id>,
         "story_id": <story_id>,
         "text": "<text>",
         "updated_at": "<updated_ at>"
		}
	"""
    Then I expect Status code 200

    Examples:
    | create_at | id | kind | person_id | story_id | text | updated_ at |
    | 2016-07-05T12:00:00Z | 300 | comment | 2073721 | 125597061 | test2-aldo | 2016-07-05T12:00:00Z |

  @smoke
  Scenario Outline: Comments PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1655469/stories/126047265/comments/143553977 with json
	"""
		{
          "id": <id>,
          "story_id": <story_id>,
          "text": "<text>"
		}
	"""

    Then I expect Status code 200

    Examples:
      | id | story_id | text |
      | 143553977 | 126047265 | test2-Update1234 |

  @smoke
  Scenario: Comments DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1655469/stories/126047265/comments/143586549
    Then I expect Status code 204