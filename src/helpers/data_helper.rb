class DataHelper

  def self.rehash_to_symbol_keys(hash)
    rehash = {}
    hash.each do |key, value|
      rehash[key.to_sym] = value
    end
    rehash
  end
  def self.get_json(string)
    parser = JSON::Ext::Parser.new(string)
    json = parser.parse
    json
  end
end