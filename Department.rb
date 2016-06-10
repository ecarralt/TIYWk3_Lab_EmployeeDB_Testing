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
end


# dept = Department.new
#
# puts dept.departments
#
# dept.create_dept("sales", ["james", "enrique"])
