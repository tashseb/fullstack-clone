require_relative 'crop'

class Rice < Crop
  attr_reader :grains

  def initialize
    @grains = 0
  end

  def water!
    @grains += 5
  end

  def transplant!
    @grains += 10
  end
end
