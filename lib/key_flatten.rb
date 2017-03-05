require "key_flatten/version"

module KeyFlatten
  def self.key_flatten(hash, symbolize_keys: false, delimiter: '.', prefix: nil, result: {})
    hash.each do |k, v|
      flat_key = prefix.nil? ? k.to_s : "#{prefix}#{delimiter}#{k}"
      flat_key = symbolize_keys ? flat_key.to_sym : flat_key.to_s

      if v.is_a?(Hash)
        self.key_flatten(v, symbolize_keys: symbolize_keys, delimiter: delimiter, prefix: flat_key, result: result)
      else
        result[flat_key] = v
      end
    end

    result
  end

  def key_flatten(symbolize_keys: false, delimiter: '.', prefix: nil)
    ::KeyFlatten.key_flatten(self, symbolize_keys: symbolize_keys, delimiter: delimiter, prefix: prefix)
  end
end
