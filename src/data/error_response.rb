require_relative 'base_class_for_data_classes'
require_relative '../../src/helpers/data_helper'

class ErrorResponse < BaseClassForDataClasses
  attr_accessor :code,
                :kind,
                :error,
                :general_problem
  def initialize (values = {})
    super values
  end

  # def self.get_array(string)
  #   array_projects = []
  #   object_json = DataHelper.get_json(string)
  #   object_json.each {| value |
  #     array = DataHelper.rehash_to_symbol_keys(value)
  #     auxiliar = Project.new(array)
  #     array_projects.push(auxiliar)
  #   }
  #   array_projects
  # end

  def self.get_parser_error(string)
    object_json =DataHelper.get_json(string)
    result=DataHelper.rehash_to_symbol_keys(object_json)
    project=ErrorResponse.new(result)
    project
  end

end


