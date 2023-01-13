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
  end
end