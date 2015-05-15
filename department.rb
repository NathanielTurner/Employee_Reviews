class Department

  attr_reader :name, :staff

  def initialize(name)
    @name = name
    @staff = []
  end

  def add(who)
    @staff << who
  end
"hi"
  def staff_pay
    total = 0
    staff.each do |who|
      total += who.pay
    end
    return total
  end

  def interpret(who, what:"terrible")
    found = who.review.scan(/#{what}/)
    return found
  end

hi
end
