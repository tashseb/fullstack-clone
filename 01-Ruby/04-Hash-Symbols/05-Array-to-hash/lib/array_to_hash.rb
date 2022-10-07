def array_to_hash(array)
  yield(array) if block_given?
  array.map.with_index do |value, index|
    if block_given?
      ["key#{index}", value]
    else
      [index.to_s, value]
    end
  end.to_h
end
