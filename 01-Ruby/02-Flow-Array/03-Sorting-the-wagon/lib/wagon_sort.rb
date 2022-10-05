def wagon_sort(students)
  # TODO: return (not print!) a copy of students, sorted alphabetically
  result = []
  result if students.empty?
  students.sort_by { |names| names.downcase }
end
