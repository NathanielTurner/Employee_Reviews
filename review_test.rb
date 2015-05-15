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
    assert x.staff.include?(y)
  end

  def test_department_staff_salaries_can_be_totaled
    x = Department.new("sleeplessRus")
    y = Employee.new("Nate", "my.mail", 919602, 50000000)
    z = Employee.new("Emily", "my.mail", 919602, 80000)
    x.add(y)
    x.add(z)
    assert_equal 50080000, x.total
  end

  def test_
  end

  def test_
  end

  def test_
  end

  def test_
  end

  def test_
  end

end
