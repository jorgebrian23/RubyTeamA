require_relative 'base_class_for_data_classes'
require_relative '../../src/helpers/data_helper'
require_relative '../data/validation_errors'

class ErrorResponse < BaseClassForDataClasses
  attr_accessor :code,
                :kind,
                :error,
                :general_problem,
                :validation_errors
  def initialize (values = {})
    super values
    if self.validation_errors
      array = self.validation_errors
      validations_array = case
                            when array.respond_to?(:each)
                              self.validation_errors
                            else
                              #nothing to do
                          end
      array = []
      validations_array.each do|validation_errors|
        rehash = DataHelper.rehash_to_symbol_keys(validation_errors)
        object_validator = ValidationErrors.new(rehash)
        array.push(object_validator)
      end
      self.validation_errors = array
    end
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


