Ruby [ juggling pebbles ]
--------------------------
Learning new language is always exciting and overwhelming, I have heard a lot about simplicity of `ruby` but never had an opportunity to work until now. So thought i will make an effort to learn, embrace the language.

Playground: [repl it](https://repl.it/languages/ruby)

### 1. Introduction ( parts unknown )

I have had an opportunity to work on `java`, `angular`, `shell`, `javascript` and lately started to learn `react`. The syntax to `ruby` seems to be much more simpler than all of the above and yet embraced widely.

-(i). Variables are private and cannot be accessed directly outside of the class.    
-(ii). Methods inside the class are public.
-(iii). Methods doesn't need to have explicit `return` for returning the method call.
-(iv). Constructors are defined by declaring `initialize` method inside the class.
-(v). Variable doesn't need to have `type` declaration. Example: In java `int value = 10;` assigns int type to value. In ruby we can simply say `value = 10`.
-(vi). ruby doesn't have multiple inheritance instead we can use `modules`.
-(vii). `check ||= 10` this is used to assign value of 10 to check variable if it doesn't exist before. If check is not present ruby creates a variable with value `nil` (i.e null) and assign 10. This doesn't work for boolean, so stay away from that.
-(viii). Range literal can be used to print numbers. `(1..5)` is equivalent to (1,2,3,4,5).
-(ix). Everything in ruby are `objects`. I mean event numbers, variable, method etc.
-(x). Numbers are immutable, Strings are mutable and hence increment and decrement doesn't work in ruby.
-(xi). ruby doesn't have boolean values but `true` and `false` are instances of TrueClass and FalseClass. 

### 2. Class

The syntax for creating class always starts with lower case `class` before the class name in uppercase `StarWars`. End of the class has to be defined explicitly by `end`. Please note, ruby suggest using `underscore` separation in name declaration instead of camelCase expect in class name definition.

#### Step 1:
```ruby
# defining class StarWars with uppercase
class StarWars
  # defining method with underscore separation
  def clone_troopers
    trooper_number = 10 # declaring local Variable
    puts " Hello all #{trooper_number} troopers !!" # puts for printing and accessing the trooper_number
  end #end of method
end #end of class

#access class method
star_wars = StarWars.new # is equivalent to StarWars star_wars = new StarWars();
star_wars.clone_troopers
```

#### Step 2 ( instance variable : @trooper_number ):

Notice we declared local variable in Step 1 which will only hold the value when the method is called and once the method returns trooper_number becomes `undefined`. Altering the call to test the problem before using instance variable,

```ruby
class StarWars
  def clone_troopers
    trooper_number = 10 # declaring local Variable
    puts " Hello all #{trooper_number} troopers !!"
    army_force #calling method2
  end #end of method1

  def army_force
    puts trooper_number
  end #end of method2
end #end of class

star_wars = StarWars.new
star_wars.clone_troopers
```
Error:
```ruby
Hello all 10 troopers !!
undefined local variable or method `trooper_number` for #
```
A local variable is only visible/usable in the method in which it is defined (i.e., it goes away when the method returns).

An instance variable, on the other hand, is visible anywhere else in the instance of the class in which it has been defined (this is different from a class variable, which is shared between all instances of a class). Keep in mind, though, that when you define the instance variable is important. If you define an instance variable in one method, but try to use it in another method before calling the first one, your instance variable will have a value of nil:
[source](https://stackoverflow.com/questions/12142193/ruby-difference-between-instance-and-local-variables-in-ruby).

```ruby
class StarWars
  # defining method with underscore separation
  def clone_troopers
    @trooper_number = 10 # declaring instance Variable
    puts " Hello all #{@trooper_number} troopers !!" # puts for printing and accessing the trooper_number
    army_force #calling methdod2
  end #end of method

  def army_force
    puts @trooper_number
  end
end #end of class

star_wars = StarWars.new
star_wars.clone_troopers
```

#### Step 3 ( Accessing instance variable )

We can't access instance variable how we accessed class methods as methods are by default public and instance variables are private to that method. So we define a method which returns the instance variable and can be accessed using class instance.

```ruby
def trooper_number
    @trooper_number
end

star_wars = StarWars.new # declaring instance of class
star_wars.clone_troopers # need to call method, to instantiate instance variable before accessing
star_wars.trooper_number #access instance variable
```

#### Step 4 ( Accessors : attr_ ):

Ruby has solution to access instance variable without going through the pain of declaring the methods for reach variables. That's here `accessors` play it's role.
attr_accessor : read and write access to instance variable
attr_read : read access to instance variable
attr_write : write access to instance variable

```ruby
class StarWars
  attr_accessor :trooper_number #made our life easy
  def clone_troopers
    @trooper_number = 10 # declaring instance Variable
    puts " Hello all #{@trooper_number} troopers !!"
    army_force #calling method2
  end #end of method

  def army_force
    puts @trooper_number
  end

end #end of class

star_wars = StarWars.new
star_wars.clone_troopers
star_wars.trooper_number
```
if we want to assign a value to instance variable inside different method then we need to use self. so it will look like `self.trooper_number`, if we don't use self then we will be declaring local variable instead which is not our intention.

multiple instance variable declaration,
```ruby
attr_accessor :trooper_number, :name, :age
```
#### Step 5 ( Inheritance : < ParentClassName )

```ruby
class StarWars < ScifiMovies
  # can do method overwrite even changing the number of arguments
  # super(arguments) will call all the parent methods
end
```

### 3. If, Else, While and Try ( Flow Control ):

In ruby expressions can be assigned to a variable, So typical if and else can be written as
```ruby
check_value = 9
result = if check_value > 10
  then "Need Attention !"
elsif check_value == 10
  then " We Matched !"
else
  " We Good"
end

puts result
```
Ternary Operator:
```ruby
check_value = 11
result = check_value > 10 ? true : false
puts result
```

Blocks:
The blocks are iterable code executed between `do` and `end`. Block's are used in `each` method which is an alternative for typical for loop. Typical for loop is

```ruby
#typical for loop
for i in (1..5)
  puts i
end

#each with block method
(1..5).each do
  puts "Looping"
end

#each with block to access elements
(1..5).each do |number|
  puts "Looping #{number}"
end

#to access index with each
(1..5).each_with_index do |number, index|
  puts "Looping #{number} and has index #{index}"
end
```

### Reference:
1. [LaunchSchool](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1)
2. Ruby Fundamentals by Alex Korban
