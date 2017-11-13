### Arrays in Ruby

[Ruby doc](https://ruby-doc.org/core-2.4.1/Array.html#method-i-each) has covered pretty much about everything, however i am making an effort to explain the methods we can leverage to work with an array.

> check if the object/variable is an array by `@some_var.is_a?(Object)` #true.

#### 1. Example Data:

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

#### 2. Each  

Similar to typical `for` loop iteration can be done via `each` in ruby on array and/or hash. The below example shows how the each iterator traverse through the items of the array. If we need index of each item then we can also use `each_index`. Array #each executes block of code for each element and return the array itself. Note the returned original array value doesn't change ( doesn't mutate ).

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
So the initial array didn't change but we were able to extract the value based on our requirement ( i.e age must be greater than 25 )

#### 3. Map ( also called as #collect)

Map is a abstraction of each, similar to array.each `map` iterates through the given block and returns the `new` array instead of the array itself. So it doesn't mutate the original array and returns the new one. So in below example we can `upper case` the item of original array.

```ruby
data.map do |item|
  if item[:name].upcase == "MATT"
    puts "Hello #{item[:name]}"
  end
end
puts data #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}{:id=>101, :name=>"Matt", :age=>"28", :job=>"Engineer"}
```
The array still didn't change so we need to explicitly tell it's okay to override. So that can be done by `!`.
```ruby
data.map do |item|
  if item[:name].upcase! == "MATT"
    puts "Hello #{item[:name]}"
  end
end
puts data #{:id=>100, :name=>"ROB", :age=>"22", :job=>"Tester"}{:id=>101, :name=>"MATT", :age=>"28", :job=>"Engineer"}
```
If we have requirement to append some hash property if we find a match then we can accomplish using map to return a new array with appended value.
```ruby
new_data = data.map do |each_item|
  if each_item[:age].to_i > 25
    {
      :name => each_item[:name],
      :age => each_item[:age],
      :job => each_item[:job],
      :category => "Young"
    }
  end
end
puts new_data #{:name=>"Matt", :age=>"28", :job=>"Engineer", :category=>"Young"}
```
if we want to append hash value to existing array instead of new, then we can do something like this.
```ruby
data.map do |each_item|
  if each_item[:age].to_i > 25
    each_item[:category] = "Young"
  end
end
puts data #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}{:id=>101, :name=>"Matt", :age=>"28", :job=>"Engineer", :category=>"Young"}
```

#### 4. Select

If we are interested in pulling certain element if the condition satisfied then we can use `.select` instead. Select will iterative over all elements of array and returns the element which matches the criteria. Example: If we are interested in fetching array element which has age more than 25 then we can write as below,
```ruby
new_array = data.select do |each_item|
  each_item[:age].to_i > 25
end
puts new_array #{:id=>101, :name=>"Matt", :age=>"28", :job=>"Engineer"}
```
4.1 Select between two Arrays

Addition to our first array `data` we need to compare another array `compare_data` then we have to loop through both array item and find the data array element which matches with compare_data array and return the values. Example compare data is,
```ruby
compare_data = [{"age": "22"}]
```
Our data has only one element which has age of 22, so we just need to select that element so
```ruby
new_array = data.select do |each_item|
  compare_data[0][:age].include?(each_item[:age])
end
puts new_array #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}
```
If we have list of string values for age, then the select can be performed as below,
```ruby
compare_data = ["21", "27", "22" ]

new_array = data.select do |each_item|
  compare_data.include?(each_item[:age])
end
puts new_array #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}
```
If we have list of hashes with age values then we need to perform 2 steps, (i) extract the name from the array and (ii). apply select on result to compare.
Example Data to compare:   
```ruby
compare_data = [{"age": "21"},{"age": "29"},{"age": "22"} ]
```
Logic to perform Select
```ruby
result = compare_data.map { |item| item[:age] }
puts result #21,29,22
final_data = data.select do |each_item|
  result.include?(each_item[:age])
end
puts final_data #{:id=>100, :name=>"Rob", :age=>"22", :job=>"Tester"}
```
4.2 Whats wrong ?
What happens if we use map inside a select ? instead of mapping the compare_data to list of numbers and then apply select?
```ruby
final_data = data.select do |each_item|
  test = compare_data.map do |i|
    i[:age].include?(each_item[:age])
  end
  puts test.to_s #[false, false, true] and [false, false, false]
  puts test.is_a?(Object) #true and true
end
```
So the returning value is array of boolean values instead of just boolean. If we check running `select` on array it returns false all the time.
```ruby
final_data = data.select do |each_item|
 [false]
end
# will return all the data back, but if we use false instead of array of false it will return nil.
```
