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
end  



# A budget can list all departments with expenses less than $500
# A budget can list all employees' salaries