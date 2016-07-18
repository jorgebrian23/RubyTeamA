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

Then(/^Verify field kind is a string in comments$/) do
  @array_kind = @array_comments.map{|comments|comments.kind}
  expect(DataHelper.is_string_array?(@array_kind)).to be true
end

Then(/^Verify if the field id is a integer/)do
  @array_id = @array_comments.map{|comments|comments.id}
  expect(DataHelper.is_integer_array?(@array_id)).to be true
end

Then(/^Verify if the field story_id is a integer/)do
  @array_story_id = @array_comments.map{|comments|comments.story_id}
  expect(DataHelper.is_integer_array?(@array_story_id)).to be true
end

Then(/^Verify field text is a string in comments$/) do
  @array_text = @array_comments.map{|comments|comments.text}
  expect(DataHelper.is_string_array?(@array_text)).to be true
end

Then(/^Verify if the field person_id is a integer/)do
  @array_person_id = @array_comments.map{|comments|comments.person_id}
  expect(DataHelper.is_integer_array?(@array_person_id)).to be true
end

Then(/^Verify if the field created_at is a date time/)do
  @array_created_at = @array_comments.map{|comments|comments.created_at}
  expect(DataHelper.is_date_time_array?(@array_created_at)).to be true
end

Then(/^Verify if the field updated_at is a date time/)do
  @array_updated_at = @array_comments.map{|comments|comments.updated_at}
  expect(DataHelper.is_date_time_array?(@array_updated_at)).to be true
end