# require './department'

class Employee

  attr_accessor :name, :email, :ph, :salary, :reviews, :performance

  def create_empl(details)
    @name = details[:name]
    @email = details[:email]
    @ph = details[:ph]
    @salary = details[:salary]
  end

  def add_review(string_review)
    @reviews = string_review
  end

  def add_performance(performance_req)
    @performance = performance_req
  end

  def give_raise(percentage_raise)
    decimal = percentage_raise.to_i/100.0
    @salary = (@salary * (1 + decimal)).round(2)
  end

end

# employee_a = Employee.new
#
# details= {name: "Michael Jordan", email: "michael@nike.com", ph: "723-2323-2323", salary: 100 }
# employee_a.create_empl(details)
# performance = "Satisfactory"
#
# employee_a.add_performance(performance)
#
# print employee_a.inspect
