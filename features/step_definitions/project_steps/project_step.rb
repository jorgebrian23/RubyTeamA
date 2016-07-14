When(/^I send a (GET) request project to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)

  @array_project=[]
  object_json = DataHelper.get_json(@http_response.body)
  object_json.each {|project|
    array = DataHelper.rehash_to_symbol_keys(project)
    @my_project = Project.new(array)
    @array_project.push(@my_project)
  }

end

Then(/^Verify if the field is a string$/) do
  is_string=@array_project[0].name.kind_of?(String)
  expect(is_string).to be true
end


When(/^I send a (PUT) request project to (.*?)$/) do |method, end_point, json_text|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/project'
  http_request = @client.get_request(method, end_point)
  http_request.body=json_text
  @http_response = @client.execute_request(@http_connection, http_request)

  object_json = DataHelper.get_json(@http_response.body)
  @result=DataHelper.rehash_to_symbol_keys(object_json)
  @project=Project.new(@result)

end

Then(/^Verify if the field is a string (.*?)$/) do |project_name|
  expect(@project.name == project_name).to be true
end
