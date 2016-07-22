When(/^I want create a new project whit (POST) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/data/project'

  @http_request = @client.get_request(method,end_point)
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
  $public_project=Project.get_parser_project(@http_response.body)
end

When(/^I want create a new story whit (POST) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'
  @http_request = @client.get_request(method, "/projects/#{$public_project.id}/#{end_point}/")
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
  $public_story = DataHelper.get_parser_story(@http_response.body)
end
When(/^I want create a new epics whit (POST) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'

  @http_request = @client.get_request(method, "/projects/#{$public_project.id}/#{end_point}/")
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
  $public_epics = DataHelper.get_parser_epics(@http_response.body)
end
When(/^I want create a new epics whit (PUT) to the workflow in (.*?)$/) do |method, end_point,json_text|
  @http_request = @client.get_request(method, "/projects/#{$public_project.id}/#{end_point}/#{$public_epics.id}")
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
end
# I want create a new comments whit POST to the workflow in

When(/^I want create a new comments whit (POST) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'

  @http_request = @client.get_request(method, "/projects/#{$public_project.id}/stories/#{$public_story.id}/comments")
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
  # puts @http_response.body
  $public_comments = DataHelper.get_parser_comments(@http_response.body)

end

When(/^I want create a new workspaces whit (POST) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'

  @http_request = @client.get_request(method, end_point)
  @http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, @http_request)
  # puts @http_response.body
  $public_workspace = DataHelper.get_parser_workspaces(@http_response.body)

end

When(/^I want (DELETE) the project$/) do |method|
  @http_request = @client.get_request(method, "/projects/#{$public_project.id}")
  @http_response = @client.execute_request(@http_connection, @http_request)
end

When(/^I want (DELETE) the workspace$/) do |method|
  @http_request = @client.get_request(method, "my/workspaces/#{$public_workspace.id}")
  @http_response = @client.execute_request(@http_connection, @http_request)
end

When(/^I edit comments whit (PUT)$/) do |method,json_text|
  @http_request = @client.get_request(method,"/projects/#{$public_project.id}/stories/#{$public_story.id}/comments/#{$public_comments.id}")
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
end
# I deleted comments whit DELETE

When(/^I deleted comments whit (DELETE)/)do |method|
  @http_request = @client.get_request(method,"/projects/#{$public_project.id}/stories/#{$public_story.id}/comments/#{$public_comments.id}")
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When(/^I want edit my workspaces whit (PUT) to the workflow in (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  @http_request = @client.get_request(method,"#{end_point}/#{$public_workspace.id}")
  @http_request.body="{\"project_ids\":[#{$public_project.id}]}"
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When(/^I want edit my project whit (PUT) to the workflow in (.*?)$/) do |method, end_point,json_text|
  require_relative '../../../src/helpers/data_helper'
  @http_request = @client.get_request(method,"#{end_point}/#{$public_project.id}")
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
end


When(/^I want edit my story whit (PUT)$/) do |method, json_text|
  @http_request = @client.get_request(method,"projects/#{$public_project.id}/stories/#{$public_story.id}")
  @http_request.body=json_text
  @http_response=@client.execute_request(@http_connection, @http_request)
end



When(/^I want send a (GET) to (.*?) to the workflow$/) do |method, end_point|
@http_request = @client.get_request(method,"#{end_point}/#{$public_project.id}")
@http_response=@client.execute_request(@http_connection, @http_request)
end
#  I want send a GET to to the workflow
When(/^I send a (GET) comments to the workflow$/) do |method|
  @http_request = @client.get_request(method,"projects/#{$public_project.id}/stories/#{$public_story.id}/comments")
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When(/^I send a (GET) epics to the workflow$/) do |method|
  @http_request = @client.get_request(method,"projects/#{$public_project.id}/epics")
  @http_response=@client.execute_request(@http_connection, @http_request)
end

When(/^I send a (GET) Stories to the workflow$/) do |method|
  @http_request = @client.get_request(method,"projects/#{$public_project.id}/stories/")
  @http_response = @client.execute_request(@http_connection, @http_request)
end

When(/^I send a (GET) workspaces to the workflow$/) do |method|
  @http_request = @client.get_request(method,"my/workspaces/#{$public_workspace.id}")
  @http_response = @client.execute_request(@http_connection, @http_request)
end