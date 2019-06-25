require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name=name
        @funding=funding
        @salaries=salaries
        @employees=[]
    end
    
    attr_reader :name, :funding, :salaries, :employees
    
    def valid_title?(title)
        salaries.keys.include?(title)
    end
    
    def >(startup)
        funding > startup.funding
    end
    
    def hire(name, title)
        raise "title does not exist" if !valid_title?(title)
        employees << Employee.new(name, title)
    end
    
    def size
        employees.length
    end
    
    def pay_employee(guy)
        amount = salaries[guy.title]
        raise "not enough funding" if amount > @funding

        guy.pay(amount)
        @funding -= amount
    end
    
    def payday
        employees.each {|guy| pay_employee(guy)}
    end
    
    #-----part 3-----#
    def average_salary
        sum = 0
        employees.each { |employee| sum += salaries[employee.title]}
        sum / employees.length * 1.0
    end
    
    def close
        @employees=[]
        @funding=0
    end
    
    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each_pair do |title, salary| 
            @salaries[title] = salary if !valid_title?(title)
        end
        @employees += startup.employees
        startup.close()
    end
    
end
