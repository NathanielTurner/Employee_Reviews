require "./determiner.rb"
require "./employee.rb"

class Department

  attr_reader :name, :staff

  def initialize(name)
    @name = name
    @staff = {}
  end

  def add(who)
    @staff[who.name.to_sym] = who
  end

  def staff_pay
    total = 0
    @staff.each_value {|a| total += a.pay}
    return total
  end

  def evaluate(for_who)
    for_who.make_performance(Determiner.new(for_who.review).analyze)
  end

  def distribute(amount)
    @staff.each_value {|a| a.raise_pay(amount, deserve: a.performance)}
  end

end
