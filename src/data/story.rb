require_relative 'base_class_for_data_classes'
require_relative '../../src/helpers/data_helper'

class Story < BaseClassForDataClasses
  attr_accessor :kind,
                :id,
                :created_at,
                :updated_at,
                :story_type,
                :name,
                :current_state,
                :requested_by_id,
                :url,
                :project_id,
                :owner_ids,
                :labels

  def initialize(values = {})
    super(values)
  end

  def self.get_array(string)
      array_stories = []
      object_json = DataHelper.get_json(string)
      object_json.each {|value|
        array = DataHelper.rehash_to_symbol_keys(value)
        story = Story.new(array)
        array_stories.push(story)
      }
      array_stories
  end
end


