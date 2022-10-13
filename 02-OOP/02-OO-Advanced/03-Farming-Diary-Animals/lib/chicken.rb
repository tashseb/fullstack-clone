require_relative 'animal'

class Chicken < Animal
  attr_reader :eggs

  def initialize(gender)
    @gender = gender
    @eggs = 0
    @energy = 0
  end

  def talk
    @gender == "male" ? "cock-a-doodle-doo" : "cluck cluck"
  end

  def feed!
    super
    @gender == "female" ? @eggs += 2 : @eggs = 0
  end
end
