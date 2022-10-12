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
    @age += 1 if @age < 100
    @dead = true if @age >= 51
    @height += 1 if @age <= 10

    if @age >= 6 && @age <= 9
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    else
      @fruits = 0
    end
  end

  def dead?
    @dead
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits >= 1
  end
end
