require 'json/ext'
require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/me_details'

require_relative '../../../src/requests/Stories/stories'

#Acceptance
When(/^I send a story (GET) request to storiesGet endpoint for project (.*?)$/) do |method, id_project|
  require_relative '../../../src/data/story'
  require_relative '../../../src/helpers/data_helper'
  @http_response = StoryRequest.get_stories(@client, method, id_project)

  array_stories_json = JSON.parse(@http_response.body)
  @array_stories = []
  array_stories_json.each do|storie|
    var = DataHelper.rehash_to_symbol_keys(storie)
    obj_storie = Story.new(var)
    @array_stories.push(obj_storie)
  end
end

Then(/^Verify if the name field is string/)do
  @array_string_name = @array_stories.map{|storie| storie.name }
  @array_integer_id = @array_stories.map{|storie| storie.id }
  @array_string_kind = @array_stories.map{|storie| storie.kind }
  expect(DataHelper.is_string_array?(@array_string_name, 100) &&
             DataHelper.is_integer_array?(@array_integer_id)&&
             DataHelper.is_string_array?(@array_string_kind)).to be true
end

When(/^I send a story (GET) request to storiesIdGet endpoint for project (.*?) and story (.*?)$/) do |method, id_project, id_story|
  @http_response = StoryRequest.get_stories_byID(@client, method, id_project, id_story)
end