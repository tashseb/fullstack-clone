require_relative 'animal'

class Cow < Animal
  attr_reader :dairy, :energy, :milk

  def initialize
    @milk = 0
    @energy = 0
  end

  def feed!
    super
    @milk += 2
  end

  def talk
    "moo"
  end
end
