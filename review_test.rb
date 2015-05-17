require 'minitest/autorun'
require 'minitest/pride'
require './reviews.rb'
require "byebug"

$mock_inputs = []
def get_user_input
  $mock_inputs.shift
end

class ReviewsTest < Minitest::Test

  def test_employee_exists
    assert Employee
  end

  def test_department_exists
    assert Department
  end

  def test_can_create_new_employee
    assert Employee.new("nate", "my.mail", 919602, 50000)
  end

  def test_employees_know_thier_info
    x = Employee.new("nate", "my.mail", 919602, 50000)
    assert_equal "nate", x.name
    assert_equal "my.mail", x.email
    assert_equal 919602, x.phone
    assert_equal 50000, x.pay
  end

  def test_department_has_name
    x = Department.new("sleeplessRus")
    assert_equal "sleeplessRus", x.name
  end

  def test_departments_can_have_employees
    x = Department.new("sleeplessRus")
    y = Employee.new("nate", "my.mail", 919602, 50000)
    x.add(y)
    assert_equal y, x.staff[:nate]
  end

  def test_department_staff_salaries_can_be_totaled
    x = Department.new("sleeplessRus")
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    z = Employee.new("Emily", "my.mail", 919602, 80000)
    x.add(y)
    x.add(z)
    assert_equal 50080000, x.staff_pay
  end

  def test_employees_can_receive_reviews
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    y.give_review("./negative_two.txt")
    assert_equal File.open("./negative_two.txt", "rb").read, y.review
    y.review
  end

  def test_employees_have_performances
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    assert_equal "N.A", y.performance
  end

  def test_performace_can_be_assigned
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    y.make_performance("good")
    assert_equal "good", y.performance
  end

  def test_reviews_can_be_interpreted
    x = Department.new("sleeplessRus")
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    x.add(y)
    y.give_review("./negative_two.txt")
    assert_equal ["has", "has", "has"], x.interpret(y.review, "has")
  end

  def test_employees_can_recieve_raises
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    y.raise_pay(0.95)
    assert_in_delta 50000000/0.95, y.pay, 0.01
  end

  def test_departments_can_raise_across_the_board
    x = Department.new("sleeplessRus")
    y = Employee.new("Nate", "my.mail", 919602, 50000)
    z = Employee.new("Emily", "my.mail", 919602, 80000)
    x.add(y)
    x.add(z)
    x.distribute(0.95)
    assert_in_delta 80000/0.95, z.pay, 0.01
    assert_in_delta (80000/0.95)+(50000/0.95), x.staff_pay, 0.01
  end

end
