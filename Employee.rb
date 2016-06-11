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
