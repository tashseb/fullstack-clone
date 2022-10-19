class EmployeesView
  def display_employee(employee)
    employee.each_with_index do |attribute, index|
      puts "#{index + 1}.)-> ID: #{attribute.id} #{attribute.username} "
    end
  end
end
