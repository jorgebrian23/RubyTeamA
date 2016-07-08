@api_test
Feature: Comments

  @test
  Scenario: Comments GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1649181/stories/125597061/comments
    Then I expect Status code 200

  @test
  Scenario Outline: Comments POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1649181/stories/125597061/comments with json
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
    | 2016-07-05T12:00:00Z | 300 | comment | 2073721 | 125597061 | test2 | 2016-07-05T12:00:00Z |