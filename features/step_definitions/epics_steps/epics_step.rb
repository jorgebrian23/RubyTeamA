When(/^I send a (GET|DELETE) request epics to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/epics'
	http_request = @client.get_request(method, end_point)
	@http_response = @client.execute_request(@http_connection, http_request)
  @epics = Epics.new(@http_response.body)
end
Then(/^Verify field kind is a string$/) do
	is_string = @epics.array_epic[0].kind.kind_of?(String)
  expect(is_string).to be true
end