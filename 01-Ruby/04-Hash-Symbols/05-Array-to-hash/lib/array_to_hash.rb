def array_to_hash(array)
  array.map.with_index do |value, index|
    [block_given? ? "#{yield}#{index}" : index.to_s, value]
  end.to_h
end
