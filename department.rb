class Department

  attr_reader :name

  def initialize(name)
    @name = name
    @employees = []
  end

  def total_salary
    total = 0
    @employees.each do |a|
      total += a.pay_is?
    end
    return total
  end
  
end
