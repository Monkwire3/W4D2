require_relative 'employee.rb'

class Manager < Employee
    def initialize(name, title, salary, boss)
        super
        @subordinates = []
    end

    def add_subordinates(subs)
        subs.each {|sub| @subordinates << sub}
    end

    def bonus(multiplier)
        total = 0
        @subordinates.each do |sub|
            total += sub.salary
            total += sub.bonus(multiplier) if sub.is_a?(Manager)
        end
        return total * multiplier
    end
end



ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

darren.add_subordinates([shawna, david])
ned.add_subordinates([darren])

p ned.bonus(1)

