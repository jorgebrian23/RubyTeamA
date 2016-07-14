require_relative 'base_class_for_data_classes'


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
end