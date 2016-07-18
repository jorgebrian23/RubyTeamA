When(/^I send a (GET) request project to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  #puts @http_response.body
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
  @project=Project.get_project(@http_response.body)
end

Then(/^Project Verify field name of project is (.*?)$/) do |project_name|
   expect(@project.name == project_name).to be true
 end



















# Then(/^Project Verify field id in projects is a boolean$/) do
#   @array_boolean = @project_array.map{|project| project.point_scale_is_custom }
#   expect(DataHelper.is_boolean_array?(@array_boolean)).to be true
# end


# When(/^I send a (GET) request project to (.*?)$/) do |method, end_point|
#   require_relative '../../../src/helpers/data_helper'
#   require_relative '../../../src/data/project'
#   http_request = @client.get_request(method, end_point)
#   @http_response = @client.execute_request(@http_connection, http_request)
#
#   @array_project=[]
#   object_json = DataHelper.get_json(@http_response.body)
#   object_json.each {|project|
#     array = DataHelper.rehash_to_symbol_keys(project)
#     @my_project = Project.new(array)
#     @array_project.push(@my_project)
#   }
#
# end
#
# Then(/^Verify if the field is a string$/) do
#   is_string=@array_project[0].name.kind_of?(String)
#   expect(is_string).to be true
# end
#
#
#
# When(/^I send a (PUT) request project to (.*?)$/) do |method, end_point, json_text|
#   require_relative '../../../src/helpers/data_helper'
#   require_relative '../../../src/data/project'
#   http_request = @client.get_request(method, end_point)
#   http_request.body=json_text
#   @http_response = @client.execute_request(@http_connection, http_request)
#
#   object_json = DataHelper.get_json(@http_response.body)
#   @result=DataHelper.rehash_to_symbol_keys(object_json)
#   @project=Project.new(@result)
#
# end
#
# Then(/^Verify if the field is a string (.*?)$/) do |project_name|
#   expect(@project.name == project_name).to be true
# end
