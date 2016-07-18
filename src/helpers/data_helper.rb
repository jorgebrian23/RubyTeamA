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
end