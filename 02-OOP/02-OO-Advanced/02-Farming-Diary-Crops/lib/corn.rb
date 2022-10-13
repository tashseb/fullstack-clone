require_relative 'crop'

class Corn < Crop
  attr_reader :grains

  def water!
    @grains += 10
  end
end
