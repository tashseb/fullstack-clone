# TODO: you can build your horse race program here!
horses = ['lucky coder', 'big time', 'fast rabbit', 'crazy diamond', 'sho']

result = nil
until result == "N"
  winner = horses.sample
  horses.each_with_index { |horse, index| puts "#{index + 1}. #{horse}" }
  puts "Please select the number of your chosen horse:"
  choice = gets.chomp.to_i - 1
  # choice = get the user's choice (convert to integer then convert index) (- 1 for index)
  # choice_horse = convert the user's number into a horse's name
  choice_horse = horses.find.with_index { |_horse, index| index == choice }

  if choice_horse == winner
    puts "Congratulations! Winning horse is #{winner} You chose: #{choice_horse}"
  else
    puts "Sorry. You lose. You chose: #{choice_horse}. Winning horse is #{winner}"
  end
  puts "Want to bet on another horse? [Y/N]"
  result = gets.chomp
end
