require "byebug"
class Employee
  attr_accessor :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @bonus = 0
  end
  
  def bonus(multiplier)
    p @bonus = @salary * multiplier
  end 
end 

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, *arr)
    # debugger
    @employees = arr
    super(name, title, salary, boss)
  end
  
  def bonus(multiplier)
    # debugger
    employee_sum = 0
    employees.each{|employee| employee_sum += employee.salary}
    p @bonus = employee_sum * multiplier
  end 
end 

shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned", shawna, david)
ned = Manager.new("Ned", "Founder", 1000000, nil, darren, shawna, david)

david.bonus(3) # => 30_000
darren.bonus(4) # => 88_000
ned.bonus(5) # => 500_000