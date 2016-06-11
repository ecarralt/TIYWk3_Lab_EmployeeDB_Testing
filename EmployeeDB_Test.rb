require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require './employee'
require './department'

class EmplDBTest < MiniTest::Test

####Department creation testing#####

  def test_new_dept_created
      dept = Department.new
      dept.create_dept("Accounting")
      assert_equal "Accounting", dept.name
  end

  def test_dept_has_list
      dept = Department.new
      dept.create_dept("Accounting")
      assert_equal [], dept.employee_list
  end

  def test_added_employees
    dept = Department.new
    dept.create_dept("Accounting")
    dept.add_employees("Michael Jordan")
    assert_equal ["Michael Jordan"], dept.employee_list
  end

  def test_added_two_employees
    dept = Department.new
    dept.create_dept("Accounting")
    employee_list = ["Michael Jordan", "Scottie Pippen"]
    dept.add_employees(employee_list)
    assert_equal ["Michael Jordan", "Scottie Pippen"], dept.employee_list
  end

  def test_added_three_employees
    dept = Department.new
    dept.create_dept("Accounting")
    employee_list = ["Michael Jordan", "Scottie Pippen", "Michael Johnson"]
    dept.add_employees(employee_list)
    assert_equal ["Michael Jordan", "Scottie Pippen", "Michael Johnson"], dept.employee_list
  end

  ####Employee creation testing#####
  def test_new_empl_name_created
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      assert_equal "Michael Jordan", empl.name
  end
  def test_new_empl_email_created
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      assert_equal "michael@nike.com", empl.email
  end
  def test_new_empl_ph_created
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      assert_equal "723-2323-2323", empl.ph
  end
  def test_new_empl_salary_created
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      assert_equal 100, empl.salary
  end


  def test_added_review
    empl = Employee.new
    employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
    empl.create_empl(employee_details)
    review = "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.

    Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further."

    empl.add_review (review)

    assert_equal "Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.

    Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.", empl.reviews

  end

  def test_performance_added
    empl = Employee.new
    employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
    empl.create_empl(employee_details)
    performance = "Satisfactory"
    empl.add_performance(performance)
    assert_equal "Satisfactory", empl.performance
  end



###Data Operations Testing#####

  def test_salary_sum_works
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      empl2 = Employee.new
      employee_details2 = {name: "Scottie Pippen", email: "pippen@nike.com", ph: "719-1919-1919", salary: 50 }
      empl2.create_empl(employee_details2)
      salarysum = employee_details[:salary] + employee_details2[:salary]
      assert_equal 150, salarysum
    end
    

    def test_gave_perc_raise
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      raise = "10%"
      empl.give_raise(raise)
      assert_equal 110.00, empl.salary
    end

    def test_department_raise
      #Create employees
      empl = Employee.new
      employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
      empl.create_empl(employee_details)
      empl2 = Employee.new
      employee_details2 = {name: "Scottie Pippen", email: "pippen@nike.com", ph: "719-1919-1919", salary: 50 }
      empl2.create_empl(employee_details2)
      empl3 = Employee.new
      employee_details3 = {name: "Michael Johnson", email: "jj@nike.com", ph: "788-8888-8888", salary: 25 }
      empl3.create_empl(employee_details3)

      #Add performances

      empl.add_performance("Satisfactory")
      empl2.add_performance("Unsatisfactory")
      empl3.add_performance("Satisfactory")

      #Create department and add employees to it
      dept = Department.new
      dept.create_dept("Accounting")
      employee_list = [empl, empl2, empl3]

      #Add raise to a department
      dept.apply_raise("Accounting", 50, employee_list)

      #Hash the employee salaries after the raise
      salaries_actual = employee_list.map do |employee|
        employee.salary
      end

      assert_equal  [125, 50, 50], salaries_actual


    end

end
