class Employee

  attr_reader :name, :email, :phone, :pay, :review, :performance

  def initialize(name, email, phone, pay)
    @name = name
    @email = email
    @phone = phone.to_i
    @pay = pay.to_f
    @review = ""
    @performance = "N.A"
  end

  def give_review(text)
    @review = File.open("#{text}", "rb").read
  end

  def make_performance(what_to)
    @performance = what_to
  end




#array.map &:name
#assert_in_delta 129.95/3, the_price.price, 0.01  asserts the answers = within the range of 1 cent
# num = BigDecimal.new
end
