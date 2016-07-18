require_relative 'base_class_for_data_classes'


class Label < BaseClassForDataClasses
  attr_accessor :id,
                :project_id,
                :name,
                :kind,
                :created_at,
                :updated_at

  def initialize(values = {})
    super(values)
  end
end