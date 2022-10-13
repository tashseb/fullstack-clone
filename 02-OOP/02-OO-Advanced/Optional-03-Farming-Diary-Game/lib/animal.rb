class Animal
  attr_reader :talk

  def initialize
    @energy = 0
    @dairy = 0
    @talk = ""
  end

  def feed!
    @energy += 1
  end
end
