class Crop
  attr_reader :grains

  def initialize
    @grains = 0
    @crops = []
  end

  def crops(crops)
    @crops += 1
  end

  def water!
    @grains
  end

  def ripe?
    @grains >= 15
  end
end
