require_relative 'base_class_for_data_classes'
require_relative '../../src/helpers/data_helper'

class ErrorResponse < BaseClassForDataClasses
  attr_accessor :code,
                :kind,
                :error,
                :general_problem,
                :requirement

  def initialize (values = {})
    super values
  end

  def self.get_parser_error(string)
    object_json =DataHelper.get_json(string)
    result=DataHelper.rehash_to_symbol_keys(object_json)
    project=ErrorResponse.new(result)
    project
  end
end


