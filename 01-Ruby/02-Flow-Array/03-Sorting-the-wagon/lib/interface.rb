require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp
student = nil
student_in_wagon = []
while student != ""
  puts "Type a student name:"
  student = gets.chomp
  student_in_wagon << student
end
student_in_wagon.pop

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
list_students = wagon_sort(student_in_wagon)
student_population = list_students.count
removed_specials = list_students.each { |value| value.gsub!(/[^0-9A-Za-z]/, "") }
last_student = list_students[-1]
if student_population > 1
  proper_students = removed_specials.join(", ")
  final_list = proper_students.sub(", #{last_student}", " and #{last_student}")
else
  proper_students = removed_specials.join(" ")
  final_list = proper_students
end


puts "Congratulations! Your wagon has #{student_population} students:"
puts final_list
