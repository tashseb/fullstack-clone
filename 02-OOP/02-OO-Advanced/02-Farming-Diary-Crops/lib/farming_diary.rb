# DO NOT remove the two lines below, needed for display purposes
require_relative "../spec/helper/board"

require_relative "corn"
require_relative "rice"


puts "\n\n📝 Day One: Corn"
# 1. Instantiate a corn crop
corn = Corn.new
corn.water!

def crop_ripe?(crop)
  crop.ripe? ? "ripe" : "not ripe"
end

# 2. Water the corn crop

# 3. Replace 'TODO' with the value of `grains` for your crop
puts "The corn crop produced #{crop_ripe?(corn.ripe?)} grains"
# 4. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')

puts "The corn crop is #{corn_ripe}"



puts "\n\n📝 Day Two: Rice"
# 1. Instantiate a rice crop
rice = Rice.new

# 2. Water the rice crop
watered_rice = rice.water!
# 3. Transplant the rice crop
rice.transplant!

# 4. Replace 'TODO' with the value of `grains` for your crop
puts "The rice crop produced #{watered_rice} grains"
# 5. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The rice crop is #{crop_ripe?(rice.ripe?)}"


# DO NOT remove the two lines below, needed for display purposes
Board.new.display
