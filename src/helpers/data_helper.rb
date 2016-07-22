class DataHelper

  def self.rehash_to_symbol_keys(hash)
    rehash = {}
    hash.each do |key, value|
      rehash[key.to_sym] = value
    end
    rehash
  end
  # desde aca complementamos el DataHelper
  def self.get_json(string)
    parser = JSON::Ext::Parser.new(string)
    json = parser.parse
    json
  end
  def self.is_string?(value)
    value.kind_of?(String)
  end
  def self.compare_to_size(value, size) #TODO change method name
    value.size <= size
  end
  def self.is_integer?(number)
    number.kind_of?(Integer)
  end
  def self.is_boolean?(value)
    value.kind_of?(boolean)
  end
  def self.is_date_time?(date_time_string)
    date_time = DateTime.parse(date_time_string)
    date_time.kind_of?(DateTime)
  end
  def self.is_label?(label)
    require_relative '../../src/data/label'
    label.kind_of?(Label)
  end
  def self.is_validation_error?(validationError)
    require_relative '../../src/data/validation_errors'
    validationError.kind_of?(ValidationErrors)
  end
  def self.is_array?(array)
    array.kind_of?(Array)
  end
  def self.is_string_array?(array, size = nil)
    is_string = true #TODO change variable name
    array.each{|value|
      is_string = self.is_string?(value) && is_string
      is_string = self.compare_to_size(value, size) && is_string unless size.nil?
    }
    is_string
  end
  def self.is_integer_array?(array)
    is_integer = true
    array.each { |number|
      is_integer = self.is_integer?(number) && is_integer
    }
    is_integer
  end
  def self.is_boolean_array?(array)
    is_bool = true
    array.each { |value|
      is_bool = self.is_boolean?(value) && is_bool
    }
    is_bool
  end
  def self.is_date_time_array?(array)
    is_date_time = true
    array.each { |date_time_string|
      is_date_time = self.is_date_time?(date_time_string) && is_date_time
    }
    is_date_time
  end
  def self.is_label_array(array)
    require_relative '../../src/data/label'
    is_label = true
    array.each { |label_has|
      label = Label.new(self.rehash_to_symbol_keys(label_has))
      is_label = self.is_label?(label) && is_label
    }
    is_label
  end

  def self.is_validationErrors_array(array)
    require_relative '../../src/data/validation_errors'
    is_validationError = true
    array.each {|validationError_has|
      validationError = ValidationErrors.new(self.rehash_to_symbol_keys(validationError_has))
      is_validationError = self.is_validation_error?(validationError) && is_validationError
    }
    is_validationError
  end

  def self.get_hash_parse(string)
    object_json = DataHelper.get_json(string)
    DataHelper.rehash_to_symbol_keys(object_json)
  end
  def self.get_parser_story(string)
    require_relative '../../src/data/story'
    result = DataHelper.get_hash_parse(string)
    story = Story.new(result)
    story
  end
  def self.get_parser_epics(string)
    require_relative '../../src/data/epic'
    result = DataHelper.get_hash_parse(string)
    epic = Epic.new(result)
    epic
  end
  def self.get_parser_comments(string)
    require_relative '../../src/data/comments'
    result = DataHelper.get_hash_parse(string)
    comments = Comments.new(result)
    comments
  end

  def self.get_parser_project(string)
    require_relative '../../src/data/project'
    result = DataHelper.get_hash_parse(string)
    project = Project.new(result)
    project
  end

  def self.get_parser_workspaces(string)
    require_relative '../../src/data/workspaces'
    result = DataHelper.get_hash_parse(string)
    workspaces = Workspaces.new(result)
    workspaces
  end

  def self.get_parser_error_response(string)
    require_relative '../data/error_response'
    result = DataHelper.get_hash_parse(string)
    error_response = ErrorResponse.new(result)
    error_response
  end
end