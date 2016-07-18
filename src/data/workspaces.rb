require_relative 'base_class_for_data_classes'


class Workspaces < BaseClassForDataClasses
  attr_accessor :kind,
                :id,
                :name,
                :person_id,
                :project_ids

  def initialize(values = {})
    super(values)
  end

  def self.get_array(string)
    array_workspaces = []
    object_json = DataHelper.get_json(string)
    object_json.each {| value |
      array = DataHelper.rehash_to_symbol_keys(value)
      workspace = Workspaces.new(array)
      array_workspaces.push(workspace)
    }
    array_workspaces
  end
end