class Department

  attr_accessor :name, :employee_list

  def create_dept (req_name)

    @name = req_name

    @employee_list = []

  end

  def add_employees (new_employees)

    if new_employees.class == String
      @employee_list << new_employees
    elsif new_employees.class == Array

      new_employees.each do |employee|
        @employee_list << employee
      end

    else
    end
  end

  def apply_raise(dept, amt, employee_list)

    good_performers = employee_list.select do |employee|
      employee.performance == "Satisfactory"
    end

    howmany = good_performers.count

    add_to_each = amt / howmany

    good_performers.each do |employee|
      employee.salary += add_to_each
    end

  end

end

#
# empl = Employee.new
#
#
# employee_details = {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
# empl.create_empl(employee_details)
# empl2 = Employee.new
# employee_details2 = {name: "Scottie Pippen", email: "pippen@nike.com", ph: "719-1919-1919", salary: 50 }
# empl2.create_empl(employee_details2)
# empl3 = Employee.new
# employee_details3 = {name: "Michael Johnson", email: "jj@nike.com", ph: "788-8888-8888", salary: 25 }
# empl3.create_empl(employee_details3)
#
# empl.add_performance("Satisfactory")
# empl2.add_performance("Unsatisfactory")
# empl3.add_performance("Satisfactory")
#
# dept = Department.new
# dept.create_dept("Accounting")
# employee_list = [empl, empl2, empl3]
#
# puts employee_list.inspect
#
# puts "===="
#
# good_performers = employee_list.select do |employee|
#   employee.performance == "Satisfactory"
# end
#
# puts good_performers.inspect
#
# puts "===="
#
#
# howmany = good_performers.count
#
# add_to_each = 50 / howmany
#
# good_performers.each do |employee|
#   employee.salary += add_to_each
# end
#
# puts good_performers.inspect
#

# dept = Department.new
#
# puts dept.departments
#
# dept.create_dept("sales", ["james", "enrique"])
