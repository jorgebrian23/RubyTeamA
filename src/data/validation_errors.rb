require_relative 'base_class_for_data_classes'

class ValidationErrors < BaseClassForDataClasses
  attr_accessor :field,
                :problem

  def initialize(values = {})
    super (values)
  end
end
