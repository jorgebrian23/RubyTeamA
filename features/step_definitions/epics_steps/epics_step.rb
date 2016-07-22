When(/^I send a (GET|DELETE) request epics to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/epics'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @epics = Epics.new(@http_response.body)
end

Then(/^Epics Verify field id is a integer$/) do
  @array_integer = @epics.array_epic.map{|epic| epic.id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Epics Verify field kind is a string$/) do
  @array_string = @epics.array_epic.map{|epic| epic.kind }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Epics Verify field updated_at is a DateTime$/) do
  @array_date_time_string = @epics.array_epic.map{|epic| epic.updated_at }
  expect(DataHelper.is_date_time_array?(@array_date_time_string)).to be true
end

Then(/^Epics Verify field created_at is a DateTime$/) do
  @array_date_time_string = @epics.array_epic.map{|epic| epic.created_at }
  expect(DataHelper.is_date_time_array?(@array_date_time_string)).to be true
end

Then(/^Epics Verify field project_id is a integer$/) do
  @array_integer = @epics.array_epic.map{|epic| epic.project_id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Epics Verify field name is a string$/) do
  @array_string = @epics.array_epic.map{|epic| epic.name }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Epics Verify field url is a string$/) do
  @array_string = @epics.array_epic.map{|epic| epic.url }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end
Then(/^Epics Verify field label is a Label/) do
  require_relative '../../../src/data/label'
  @array_label = @epics.array_epic.map{|epic| epic.label }
  expect(DataHelper.is_label_array(@array_label)).to be true
end

When(/^Epics I send a (GET) request to (.*?)$/) do |method, end_point|
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, "/projects/#{@proyect.id}/#{end_point}")
  @http_response = @client.execute_request(@http_connection, http_request)
end

When(/^Epics I send a (POST) request to (.*?)$/) do |method, end_point, json_text|
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, "/projects/#{@proyect.id}/#{end_point}")
  http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, http_request)
end

And(/^create a new project (.*?)$/) do |project_name|
  require_relative '../../../src/data/project'
  http_request = @client.get_request("POST", "/projects")
  http_request.body = "{ \"name\" : \"#{project_name}\""
  @http_response = @client.execute_request(@http_connection, http_request)
  @proyect = Project.get_parser_project(@http_response.body)
end
And(/^create a new epic (.*?)$/) do |epic_name|
  require_relative '../../../src/data/project'
  http_request = @client.get_request("POST", "/projects/#{@proyect.id}/epics")
  http_request.body = "{ \"name\" : \"#{epic_name}\""
  @http_response = @client.execute_request(@http_connection, http_request)
  @epic = DataHelper.get_parser_epics(@http_response.body)
end
And(/^Deleted a new project$/) do
  require_relative '../../../src/data/project'
  http_request = @client.get_request("DELETE", "/projects/#{@proyect.id}")
  @http_response = @client.execute_request(@http_connection, http_request)
end

When(/^Epics I send a (PUT) request to (.*?)$/) do |method, end_point, json_text|
  require_relative '../../../src/data/project'
  require_relative '../../../src/data/epic'
  http_request = @client.get_request(method, "/projects/#{@proyect.id}/#{end_point}/#{@epic.id}")
  http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, http_request)
end

When(/^Epics I send a (DELETE) request to (.*?)$/) do |method, end_point|
  require_relative '../../../src/data/project'
  require_relative '../../../src/data/epic'
  http_request = @client.get_request(method, "/projects/#{@proyect.id}/#{end_point}/#{@epic.id}")
  @http_response = @client.execute_request(@http_connection, http_request)
end