```ruby
class Employee
  attr_accessor :name, :company, :duration
  def initialize(name, company, duration)
    @name     = name
    @company   = company
    @duration = duration
  end
end

aSong1 = Employee.new("Fleck", "AMZ", 260)
aSong2 = Employee.new("Taylor", "EMC", 120)
aSong3 = Employee.new("Bob", "Adobe", 260)
aSong4 = Employee.new("Jack", "Google", 360)

final_array = [ ]
final_array.push(aSong1)
final_array.push(aSong2)
final_array.push(aSong3)
final_array.push(aSong4)


puts final_array.length #4
final_array.collect {|x| { company: x.company, duration: x.duration }}

```
