require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe 'Budget' do
  describe '#initialize' do
    it 'exists and has attributes' do
      budget = Budget.new("2023")

      expect(budget).to be_a(Budget)
      expect(budget.year).to eq("2023")
      expect(budget.departments).to eq([])
    end

    it 'can add departments' do
      budget = Budget.new("2023")
      customer_service = Department.new("Customer Service")   
      accounting = Department.new("Accounting")
      hr = Department.new("HR")
      
      budget.add_department(customer_service)
      budget.add_department(accounting)
      budget.add_department(hr)

      expect(budget.departments).to eq([customer_service, accounting, hr])
    end

    it 'can return list of departments with expenses less than 500' do
      budget = Budget.new("2023")
      customer_service = Department.new("Customer Service")   
      accounting = Department.new("Accounting")
      hr = Department.new("HR")

      budget.add_department(customer_service)
      budget.add_department(accounting)
      budget.add_department(hr)
      
      customer_service.expense(100)
      customer_service.expense(25)
      customer_service.expense(400)
      accounting.expense(100)
      hr.expense(50)

      expect(budget.low_expenses).to eq([accounting, hr])
    end


    it 'can list all employees salaries' do
      budget = Budget.new("2023")
      customer_service = Department.new("Customer Service")   
      accounting = Department.new("Accounting")
      hr = Department.new("HR")

      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
      mary = Employee.new({name: "Mary Jones", age: "28", salary: "95000"}) 
      
      budget.add_department(customer_service)
      budget.add_department(accounting)
      budget.add_department(hr)
      
      customer_service.expense(100)
      customer_service.expense(25)
      customer_service.expense(400)
      accounting.expense(100)
      hr.expense(50)

      customer_service.hire(bobbi)
      customer_service.hire(aaron)
      accounting.hire(mary)

      expect(budget.all_salaries).to eq({mary => 95000 ,aaron => 90000 ,bobbi => 100000})
    end
  end
end