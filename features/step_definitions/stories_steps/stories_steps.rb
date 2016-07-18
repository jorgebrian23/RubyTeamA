#Acceptance
When(/^I send a (GET) story request to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/story'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @array_stories = Story.get_array(@http_response.body)
end

Then(/^Story Verify if kind field is string$/)do
  @array_string = @array_stories.map{|stories| stories.kind}
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Story Verify if id field is integer$/) do
  @array_integer = @array_stories.map{|stories| stories.id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Story Verify if created_at field is a DateTime/) do
  @array_date_time_string = @array_stories.map{|stories| stories.created_at }
  expect(DataHelper.is_date_time_array?(@array_date_time_string)).to be true
end

Then(/^Story Verify if updated_at field is a DateTime/) do
  @array_date_time_string = @array_stories.map{|stories| stories.updated_at }
  expect(DataHelper.is_date_time_array?(@array_date_time_string)).to be true
end

Then(/^Story Verify if story_type field is String/) do
  @array_string = @array_stories.map{|stories| stories.story_type }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Story Verify if name field is String/) do
  @array_string = @array_stories.map{|stories| stories.name }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Story Verify if current_state field is String/) do
  @array_string = @array_stories.map{|stories| stories.current_state }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Story Verify if requested_by_id field is integer$/) do
  @array_integer = @array_stories.map{|stories| stories.requested_by_id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Story Verify if url field is String/) do
  @array_string = @array_stories.map{|stories| stories.url }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Story Verify if project_id field is integer$/) do
  @array_integer = @array_stories.map{|stories| stories.project_id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end