# TODO: you can build your horse race program here!
horses = ['lucky coder', 'big time', 'fast rabbit', 'crazy diamond', 'sho']

result = "Y"
balance = 50
until result =~ /n/i || balance <= 10
  winner = horses.sample
  horses.each_with_index { |horse, index| puts "#{index + 1}. #{horse}" }
  puts "Please select the number of your chosen horse:"
  choice = gets.chomp.to_i - 1
  # choice = get the user's choice (convert to integer then convert index) (- 1 for index)
  # choice_horse = convert the user's number into a horse's name
  choice_horse = horses[choice]
  puts "Winning horse is #{winner}"
  if choice_horse == winner
    balance += 50
    puts "You win You chose: #{choice_horse}"
  else
    balance -= 10
    puts "Sorry, you lose. You chose: #{choice_horse}"
  end
  if balance <= 10
    puts "Sorry, you don't have enough balance to make another bet!"
  else
    puts "Your balance is #{balance}"
    puts "Want to bet on another horse? [Y/N]"
    result = gets.chomp
  end
end
