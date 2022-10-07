def array_to_hash(array)
  array.map.with_index do |value, index|
    block_given? ? ["key#{index}", value] : [index.to_s, value]
  end.to_h
end
