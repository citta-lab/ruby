### Arrays in Ruby

[Ruby doc](https://ruby-doc.org/core-2.4.1/Array.html#method-i-each) has covered pretty much about everything, however i am making an effort to explain the methods we can leverage to work with an array.

1. Example Data:

```ruby
data = [
  {
    "id": 100,
    "name": "Rob",
    "age": "22",
    "job": "Tester"
  },
  {
    "id": 101,
    "name": "Matt",
    "age": "28",
    "job": "Engineer"
  }
]
```
The above example is list of hash in an array. so if we loop each element it would give us element of an array then we need to use `symbols` to access the every property of the hash. Above `data` array can also be rewritten to be a value of hash element instead,
```ruby
data_hash = { "employeeDetails": data }
```

2. Each  

Similar to typical `for` loop iteration can be done via `each` in ruby on array and/or hash. The below example shows how the each iterator traverse through the items of the array. Each doesn't mutate the state of original array. If we need index of each item then we can also use `each_index`.

```ruby
data.each do |each_item|
    puts "1.0 Prints the array element : #{each_item}"
    puts "2.0 Prints the name hash property value of each array element : #{each_item[:name]}"
end

puts "3.0 Final array #{data}"
```
`#{each_item}` is interpolation value. The original value of the `data` doesn't change, this each can be used if we need to do something when specific value exist in the array. Example: if anyone under age 25 then call some method and pass the data.
``` ruby
@young_emp = [] #instance variable of type array
def special_call(item)
  @young_emp.push(item) #add item to new array
end

data.each do |each_item|
  if each_item[:age].to_i < 25 #our age is string and needs to be converted to integer so `to_i`
    special_call(each_item) #method call
  end
end

def special_call(item)
  young_emp.push(item)
end
puts @young_emp #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}
puts ("*****")
puts data #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}{:id=>101, :name=>"Matt", :age=>"28", :job=>"Engineer"}
```
So the initial array didn't change but we were able to extract the value based on our requirment ( i.e age must be greater than 25 )
