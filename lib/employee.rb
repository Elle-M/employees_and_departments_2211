class Employee
  attr_reader :name,
              :age,
              :salary

  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age].to_i
    @salary = attributes[:salary].tr("$", "").to_i
  end

  def give_raise(raise_amount)
    @salary += raise_amount
  end
end