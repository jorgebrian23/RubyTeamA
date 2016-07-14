class StoryRequest

  def self.get_stories(client, method, id_project)
    end_point = '/projects/%s/stories/' % id_project
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.get_stories_byID(client, method, id_project, id_story)
    end_point = '/projects/%s/stories/%s' % [id_project, id_story]
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end
end