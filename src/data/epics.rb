require_relative '../../src/helpers/data_helper'
require_relative 'epic'

class Epics
  attr_accessor :array_epic
  def initialize(string_epics)
    @array_epic = Array.new
    set_list_epic(string_epics)
  end
  def set_list_epic(string)
    object_json = DataHelper.get_json(string)
    object_json.each {|epics|
      array = DataHelper.rehash_to_symbol_keys(epics)
      @my_epic = Epic.new(array)
      @array_epic.push(@my_epic)
    }
  end
end