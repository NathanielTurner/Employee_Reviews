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

  def interpret(what, for_what)
    found = what.scan(/#{for_what}/)
    return found
  end

  def distribute(amount)
    @staff.each_value {|a| a.raise_pay(amount)}
  end

end
