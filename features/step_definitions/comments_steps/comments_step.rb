When(/^I send a (GET|DELETE) request comments to (.*?)$/) do |method, end_point|
  require_relative '../../../src/helpers/data_helper'
  require_relative '../../../src/data/comments'
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)

  @array_comments=[]
  object_json = DataHelper.get_json(@http_response.body)
  object_json.each {|comments|
    array = DataHelper.rehash_to_symbol_keys(comments)
    @comments = Comments.new(array)
    @array_comments.push(@comments)
  }

end
# validation of keys
Then(/^Verify field kind is a string in comments$/) do
  is_string = @array_comments[0].kind.kind_of?(String)
  comment = @array_comments[0];
  expect(comment.text == "Doing test put").to be true
end

Then(/^Verify if the field ID is a integer/) do
  is_integer=@array_comments[0].id.kind_of?(Integer)
  expect(is_integer).to be true
  p "Exammmpleeeeeeeeeeeee"
  p @array_comments
end
# Iteration
# Then(/^Verify all the fields in comments$/) do
#   @comments =
#   # is_string = @array_comments[0].kind.kind_of?(String)
#   # comment = @array_comments[0];
#   # expect(comment.text == "Doing test put").to be true
# end