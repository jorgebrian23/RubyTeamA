When (/^I send a (POST) request project smoke to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  @http_request=@client.get_request(method, end_point)
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
  $project_public=Project.get_parser_project(@http_response.body)
  p @project
end

When (/^i will send a (PUT) to request to project whit json$/) do |method, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  @http_request=@client.get_request(method, "/projects/#{$project_public.id}")
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When (/^I will send a (GET) request to projects$/) do |method|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  @http_request=@client.get_request(method, "/projects/#{$project_public.id}")
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When (/^I send (DELETE) request to projects$/) do |method|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  @http_request=@client.get_request(method, "/projects/#{$project_public.id}")
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When(/^I send a (GET) request project to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @project_array = Project.get_array(@http_response.body)
end

Then(/^Project Verify field id in projects is a integer$/) do
  @array_integer = @project_array.map { |project| project.id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field name in projects is a string$/) do
  @array_string = @project_array.map { |project| project.name }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field kind in projects is a string$/) do
  @array_string = @project_array.map { |project| project.kind }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field iteration_length in projects is a integer$/) do
  @array_integer = @project_array.map { |project| project.version }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field version in projects is a integer$/) do
  @array_integer = @project_array.map { |project| project.iteration_length }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end

Then(/^Project Verify field week_start_day in projects is a string$/) do
  @array_string = @project_array.map { |project| project.week_start_day }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end

Then(/^Project Verify field point_scale in projects is a integer$/) do
  @array_integer = @project_array.map { |project| project.iteration_length }
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

When(/^I send a (POST) request project and deleted to (.*?) with json$/) do |method, end_point, json_text|
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

When(/^I send a (POST) request project to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/error_response'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text
  @http_response = @client.execute_request(@http_connection, http_request)
  @project=ErrorResponse.get_parser_error(@http_response.body)
end

Then(/^Project in post Verify if the spect status is (.*?)$/) do |status_code|
  expect(@http_response.code.to_s).to eql(status_code)
end

And(/^Project in post Verify field kind is (.*?)$/) do |value|
  expect(@project.kind.to_s).to eql(value)
end

And(/^Project in post Verify field Code is (.*?)$/) do |value|
  expect(@project.code.to_s).to eql(value)
end

And(/^Project in post Verify field error is (.*?)$/) do |value|
  expect(@project.error.to_s).to eql(value)
end

And(/^Project in post Verify field general_problem is (.*?)$/) do |value|
  expect(@project.general_problem.to_s).to eql(value)
end

When(/^I send a (PUT) request project to (.*?) with json$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/error_response'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text
  @http_response = @client.execute_request(@http_connection, http_request)
  puts @http_response.body
  @project=ErrorResponse.get_parser_error(@http_response.body)

end

Then(/^Project Verify if the spect status is (.*?)$/) do |status_code|
  expect(@http_response.code.to_s).to eql(status_code)
end

And(/^Project Verify field kind is (.*?)$/) do |value|
  expect(@project.kind.to_s).to eql(value)
end

And(/^Project Verify field Code is (.*?)$/) do |value|
  expect(@project.code.to_s).to eql(value)
end

And(/^Project Verify field error is (.*?)$/) do |value|
  expect(@project.error.to_s).to eql(value)
end

And(/^Project Verify field requirement is (.*?)$/) do |value|
  expect(@project.requirement.to_s).to eql(value)
end


