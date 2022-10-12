class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)

  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def one_year_passes!
    grow!
    may_die!
    produce_fruits!
  end

  def dead?
    @dead
  end

  def grow!
    @age += 1 if @age < 100
    @height += 1 if @age <= 10
  end

  def may_die!
    @dead = true if @age >= 51
  end

  def produce_fruits!
    if @age.between?(6, 9)
      @fruits = 100
    elsif @age.between?(10, 14)
      @fruits = 200
    else
      @fruits = 0
    end
    @fruits
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits >= 1
  end
end
