class Budget
  attr_reader :year,
              :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def low_expenses
    @departments.map do |department|
      department if department.expenses < 500
    end.compact
  end

  def all_salaries
    hash = {}
    @departments.each do |department|
      department.employees.map do |employee|
        hash[employee] = employee.salary
      end
      # require 'pry'; binding.pry
    end
    hash
  end
end  


# A budget can list all employees' salaries