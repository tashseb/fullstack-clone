class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
  end

  def delicious?
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
  end
end
