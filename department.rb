class Department

  attr_reader :name, :staff

  def initialize(name)
    @name = name
    @staff = []
  end

  def add(who)
    @staff << who
  end

end
