require_relative '../views/employees_view'
require_relative '../models/employee'
require_relative '../repositories/employee_repository'

class EmployeesController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = EmployeesView.new
  end

  def list
    display_list
  end

  def display_list
    @view.display_employee(@employee_repository.all_riders)
  end
end
