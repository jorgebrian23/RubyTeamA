require_relative 'base_class_for_data_classes'

class Comments < BaseClassForDataClasses
  attr_accessor :kind,
                :id,
                :story_id,
                :text,
                :person_id,
                :created_at,
                :updated_at

  def initialize(values = {})
    super(values)
  end

  def self.get_array(string)
    array_comments = []
    object_json = DataHelper.get_json(string)
    object_json.each { |value|
      array = DataHelper.rehash_to_symbol_keys(value)
      comments = Comments.new(array)
      array_comments.push(comments)
    }
    array_comments
  end

  def self.get_parser_comments(string)
    require_relative '../../src/data/comments'
    result = DataHelper.get_hash_parse(string)
    comments = Comments.new(result)
    comments
  end
end
