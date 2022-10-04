require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "What do you want to tell your coach?"
feedback = gets.chomp

puts coach_answer(feedback) or coach_answer_enhanced(feedback)
