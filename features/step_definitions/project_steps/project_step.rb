When(/^I send a (GET) request project to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @project_array = Project.get_array(@http_response.body)
end

Then(/^Project Verify field id in projects is a integer$/) do
  @array_integer = @project_array.map{|project| project.id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field name in projects is a string$/) do
  @array_string = @project_array.map{|project| project.name }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field kind in projects is a string$/) do
  @array_string = @project_array.map{|project| project.kind }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field iteration_length in projects is a integer$/) do
  @array_integer = @project_array.map{|project| project.version }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field version in projects is a integer$/) do
  @array_integer = @project_array.map{|project| project.iteration_length }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field week_start_day in projects is a string$/) do
  @array_string = @project_array.map{|project| project.week_start_day }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field point_scale in projects is a integer$/) do
  @array_integer = @project_array.map{|project| project.iteration_length }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end


When(/^I send a (PUT) request project to (.*?) whit json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text
  @http_response = @client.execute_request(@http_connection, http_request)
  @project=Project.get_parser_project(@http_response.body)
end

Then(/^Project Verify field name of project is (.*?)$/) do |project_name|
   expect(@project.name == project_name).to be true
 end



When(/^I send a (POST) request project to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text

  @http_response = @client.execute_request(@http_connection, http_request)
  @project=Project.get_parser_project(@http_response.body)

end

Then(/^Project Verify field name of the new project is (.*?)$/) do |name_to_compare|
  expect(@project.name == name_to_compare).to be true

end

Then(/^Project will be (DELETE) by ID$/) do |method|
  http_request = @client.get_request(method, "/projects/#{@project.id}")
  @http_response = @client.execute_request(@http_connection, http_request)
end