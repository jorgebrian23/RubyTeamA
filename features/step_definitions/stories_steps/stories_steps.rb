#To workflow
When(/^I send a (POST) request story smoke to (story)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  require_relative '../../../src/data/story'
  @http_request = @client.get_request("POST","/projects")
  @http_request.body="{\"name\": \"Jin's Project\" }"
  @http_response=@client.execute_request(@http_connection, @http_request)
  $stories_project=Project.get_parser_project(@http_response.body)

  @http_request=@client.get_request(method,"/projects/#{$stories_project.id}/stories/")
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
  $story_public = DataHelper.get_parser_story(@http_response.body)
end

When(/^I send a (PUT) request story smoke to (story)$/) do |method, end_point,json_text|
  @http_request = @client.get_request(method, "/projects/#{$stories_project.id}/stories/#{$story_public.id}")
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
end

When(/^I send a (DELETE) request story smoke to story$/) do |method|
  @http_request  = @client.get_request(method,"/projects/#{$stories_project.id}/stories/#{$story_public.id}")
  @http_response=@client.execute_request(@http_connection, @http_request)
end
And(/^Delete project$/) do
@http_request = @client.get_request("DELETE", "/projects/#{$stories_project.id}")
@http_response=@client.execute_request(@http_connection, @http_request)
end

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

When(/^I send a (POST) story request  to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text

  @http_response = @client.execute_request(@http_connection, http_request)
  @story = DataHelper.get_parser_story(@http_response.body)
end

Then(/^Story verify field name of the new story is (.*?)$/) do |name_to_compare|
  expect(@story.name == name_to_compare).to be true
end

Then(/^Story will be (DELETE) by ID$/) do |method|
  http_request = @client.get_request(method, "/projects/1655063/stories/#{@story.id}")
  @http_response = @client.execute_request(@http_connection, http_request)
end

#Negative
When(/^I send a negative (POST) story request  to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/error_response'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text

  @http_response = @client.execute_request(@http_connection, http_request)
  @error_response = ErrorResponse.get_parser_error(@http_response.body)
end

And (/^Story response code is (.*?)$/) do |code|
  expect(@error_response.code.to_s).to eql(code.to_s)
end
And (/^Story response kind is (.*?)$/) do |kind|
  expect(@error_response.kind.to_s).to eql(kind.to_s)
end
And (/^Story response error is (.*?)$/) do |error|
  expect(@error_response.error.to_s).to eql(error.to_s)
end
And (/^Story response general_problem is (.*?)$/) do |general_problem|
  expect(@error_response.general_problem.to_s).to eql(general_problem.to_s)
end
And (/^Story response validationErrorsName is (.*?)$/) do |validationErrorName|
  expect(@error_response.validation_errors[0].field.to_s).to eql(validationErrorName.to_s)
end