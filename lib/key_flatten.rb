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

  def self.key_unflatten(hash, symbolize_keys: false, delimiter: '.', result: {})
    hash.each do |k, v|
      keys = k.to_s.split(delimiter)
      last_key = symbolize_keys ? keys.pop.to_sym : keys.pop

      h = keys.reduce(result) do |h, k|
        k = k.to_sym if symbolize_keys
        h[k] = {} unless h.key? k
        h[k]
      end

      h[last_key] = v
    end

    result
  end

  def key_flatten(symbolize_keys: false, delimiter: '.', prefix: nil)
    ::KeyFlatten.key_flatten(self, symbolize_keys: symbolize_keys, delimiter: delimiter, prefix: prefix)
  end

  def key_unflatten(symbolize_keys: false, delimiter: '.')
    ::KeyFlatten.key_unflatten(self, symbolize_keys: symbolize_keys, delimiter: delimiter)
  end
end
