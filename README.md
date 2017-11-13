Ruby [ juggling pebbles ]
--------------------------
Learning new language is always exciting and overwhelming, I have heard a lot about simplicity of `ruby` but never had an opportunity to work until now. So thought i will make an effort to learn, embrace the language.

Playground: [repl it](https://repl.it/languages/ruby)

### 1. Introduction ( parts unknown )

I have had an opportunity to work on `java`, `angular`, `shell`, `javascript` and lately started to learn `react`. The syntax to `ruby` seems to be much more simpler than all of the above and yet embraced widely.

- Variables are private and cannot be accessed directly outside of the class.    
- Methods inside the class are public.
- Methods doesn't need to have explicit `return` for returning the method call.
- Constructors are defined by declaring `initialize` method inside the class.
- Variable doesn't need to have `type` declaration. Example: In java `int value = 10;` assigns int type to value. In ruby we can simply say `value = 10`.
- ruby doesn't have multiple inheritance instead we can use `modules`.
- `check ||= 10` this is used to assign value of 10 to check variable if it doesn't exist before. If check is not present ruby creates a variable with value `nil` (i.e null) and assign 10. This doesn't work for boolean, so stay away from that.
- Range literal can be used to print numbers. `(1..5)` is equivalent to (1,2,3,4,5).
- Everything in ruby are `objects`. I mean event numbers, variable, method etc.
- Numbers are immutable, Strings are mutable and hence increment and decrement doesn't work in ruby.
- ruby doesn't have boolean values but `true` and `false` are instances of TrueClass and FalseClass.
- The process of initializing the arguments using `initialize` constructor is called `mass assignment`.
- `helper` : helper is a specific to controller helper methods and we should make use of the `helper` class to use anywhere in the application. example: `app/helpers/controllername_helper.rb`
-

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
    army_force #calling method2
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
#### Ternary Operator:
```ruby
check_value = 11
result = check_value > 10 ? true : false
puts result
```

present?
```ruby
!value.empty? && value.length > 0 && !value.nil?
#can be replaced with
value.present?
```

#### Blocks:
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

#### Pure Functions

We can use pure functions on array similar to javascript. Below are the few examples,
- array.reduce
- array.map
- array.sort
- array.select
- array.each_cons


### 4. Methods

#### a. Method Overloading / Default Arguments

Ruby doesn't have method overloading, so we cannot use the same method name in a class with different arguments instead we can call the same method with all or any of the arguments defined in the method.

Doesn't work, the first method never called.
```ruby
#method1
def halloween(color,price)
  if price <= 0
    then "Invalid Price !"
  else
    if color != nil
      then " The costume you have picked has #{color} color and of cost $#{price}"
    end
  end
end

#method2
def halloween(color)
  if color != nil
    then " you picked color #{color}"
  end
end

halloween("red",12)
halloween("yellow")
```
Now we have used the same method name but arguments have default value if it's not passed, so we can don't have to relay on method overloading.

```ruby
#method1
def halloween(color="white",price=1)
  if price <= 0
    then "Invalid Price !"
  else
    if color != nil
      then " The costume you have picked has #{color} color and of cost $#{price}"
    end
  end
end

#halloween("red",12) #uncomment and comment other two for testing
#halloween("yellow") #uncomment and comment other two for testing
halloween()
```

#### b. Array parameter

If we don't know number of arguments we need to pass then we can define a method to handle the arguments as an array.

```ruby
#method1
def halloween(*color)
  if color.size > 1
    color.each_with_index do |element, index|
      puts "#{index} has color #{element}"
    end
    elsif color.size == 1
      "you have picked one color : #{color}"
    else
      "Oh no, don't you like colors?"
  end
end

halloween("yellow","green","blue")
#halloween()
```

### 5. Array

By default we can't mutate the array but using "BANG" we can mutate the behavior. Some of the useful array functions are
```ruby
a = [ 42, 8, 9, 7]
a.empty ? #false
a.include?(8) #true
a.sort #[7,8,9,42]
a.reverse #[7,9,8,42]
a.shuffle #[8,42,7,9]
a #[42,8,9,7] So the values of array 'a' didn't change
```

Mutating the state ( Bang, Bang !!)
```ruby
a.sort! #[7,8,9,42]
a #[7,8,9,42] The values of array 'a' has been changed and will remain the same.
```

Userful array functions
```ruby
a.push(6) #[7,8,9,42,6]
a << 10 #[7,8,9,42,6,10]
a << "test" #[7,8,9,42,6,10,"test"]
a.join #[78942610test]
a = %w[foo bar baz quux]         # Use %w to make a string array.
```

Array of objects  
When the array of objects are given and need to alter the resulting array then `map` or `collection` can be used. In below example we will be removing the `name` property of the instance from the resulting array.
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
```
Now we can use collection to remove name from the resulting array,
```ruby
final_array.collect {|x| { company: x.company, duration: x.duration }}
```
I have a separate section about Arrays as they are very important. Please refer [Arrays in Ruby](https://github.com/citta-lab/ruby/blob/master/Array.md).   

#### d. Hashes and Symbols
In ruby hashes are like `HashMap<K,S>` in java. It will act as an key and value pair but it doesn't guarantee the order. If we prefer order of the data then we might have to pick `Array` over hashes. An empty hash can be represented by `{}`. So user empty hash looks like `user = {}`.

Evolution #1:
```ruby
user = { "first_name" => "Bob", "last_name" => "Henderson", "age" => "23"} #defiend hash
user["age"] #retrieving hash. This will give "23"
```
'=>' is called hasrocket. In ruby most commonly people use symbols to represent the key and in rails tutorial symbols has been defined as "Symbols are a special Ruby data type shared with very few other languages, so they may seem weird at first, but Rails uses them a lot, so you’ll get used to them fast. Unlike strings, not all characters are valid:". So symbols are represented as `:first_name`. etc

Evolution #2:
```ruby
user = { :first_name => "Bob", :last_name => "Henderson", :age => "23"}
user[:age] #retrieving hash. This will give "23"
```
As of latest ruby symbols with in Hashes can also be represented as mentioned below, more readable perhaps.    

Evolution #3:
```ruby
user = { first_name: "Bob", last_name: "Henderson", age: "23"}
user[:age] # retrieving hash. This will give "23"
```
The bottom line is that `:first_name =>` and `first_name:` are effectively the same only inside literal hashes.

Evolution #4:
Nested Hashes can be created by adding a Hash inside the Hash by using the Symbol. So that would be,
```ruby
params = {}
params[:user] = { first_name: "Bob", last_name: "Henderson", age: "23"}
puts params #result in {:user=>{:first_name=>"Bob", :last_name=>"Henderson", :age=>"23"}}
puts params[:user][:age] #23
```
Evolution #5: ( Colon )
As ruby version evolved, `:` usage has been modified as per the user need. So in short below are the few examples
```ruby
1. {:name => "foo"} same as {name: 'foo'}
2. def foo(bar:) declaring parameter bar in a method
3. foo(bar: 42) passing argument 42 for method call
```


[Ruby Code Guide](https://github.com/bbatsov/ruby-style-guide#syntax)


Ruby on Rails [ juggling pebbles ]
--------------------------

```ruby
> rails -v #checking rails version
> rails new HU #creating new rails project
> rails server #starting rails server
> rails generate controller home index # creating controller (i.e home) and action (i.e index)
```

### 0. What Happend ?
When we executed rails command to create controller rails did the magic to create few things and it is very important to understand the syntax. So here is the list.

Executed Command:
```ruby
rails generate controller home index
```
Syntax is `rails generate controller <controllername> <action>`


Generated Controller:
```ruby
home_controller.rb
```
rails has created `<controllername>_controller` ruby file under app/controllers/ and the home_controller also has ACTION defined from `<action>`.
```ruby
class HomeController < ApplicationController

  def index
  end

end
```

Generated Views:
```ruby
index.html.erb
```
rails has created `<action>.html.erb` file inside app/views/<controllername> i.e `app/views/home/`.
Notice rails has created directory with controller name in the view and action as .html.erb file.

Generated Routes:
```ruby
get 'home/index'
```
rails has added routes as `<controllername>/<action>` as routes in app/config/routes.rb. We can also write routes as `get '/about' => 'home#about'` i.e `get '/<action>' => '<conttoller>#<action>'`. That is upon routing page about rails will talk to action method `about` inside `home` controller.

### Tricks and Tips:

- files starts with underscore `_` are partial html files which will not render by it's own but always attached to one of pain html page. Example: `_new_form_page.html.erb` indicates this is partial html page and will be embedded to normal html page `main.html.erb`.
- When we want to render this page in main.html.erb page we need to add `render` method without starting underscore or file extention. So `_new_form_page.html.erb` can be rendered by `<% render 'home/new_form_page' %>`.
- `<% ..... %>` indicates Rails should call the provide function. This doesn't display the code snippet to the DOM but used in looping or holidng vairable or checking value etc.
- `<%= .... %>` we use this to insert the value or template to the DOM.
- Rails uses a file called schema.rb in the db/ directory to keep track of the structure of the database (called the schema, hence the filename).
- By default, methods defined in any helper file are automatically available in any view.

### Undo-Ing Tips:
```ruby
$ rails destroy  controller <controlername> <action1> <action2>   #removes the controller and actions related to it.
$ rails destroy model <modalname>  #note we don't need to pass the arguments which are used as columns in table creation. just the parent.
$ rails db:rollback #rolls back the db:migrate changes ( i.e undo the create table execution )
$ rails db:migrate VERSION=0 #roll back to particular version of db
```

### Useful Snippet:

1. Provide and Yield:
We can use `provide` and `yield` functiont to insert the value to DOM. In below example we are assigning a value to title and retriving the value back in the DOM using yield.
```ruby
<% provide(:title, "Home") %>
<html>
  <title><%= yield(:title) %>
</html>
```
The distinction between the two types of embedded Ruby is that `<% ... %>` executes the code inside, while `<%= ... %>` executes it and inserts the result into the template.





### Rails Concepts:
1. Form Routing :
Mainly there are three steps we need to perform to make routing works in rails app, probably we always want to start from the form action level to think where the form needs to be summited upon submit or click. url will change to `http://localhost:3000/questions`.

```html
<!-- trying to route to questions page -->
<form class="form-horizontal" action="/questions" method="POST">
```

Now we need to let the router know what it has to do when it sees `/questions`. Path for routes file is `config/routes.rb`.
```ruby
post '/questions' => 'home#questionpage'
```

Define method in controller `app/controller/home_controller.rb`
```ruby
def questionpage
  redirect_to root_path #this will redirect to main root page and _path will be used by helper method
end
```

### 2. Authenticity Token:
No forms in the Rails app are allowed to submit the form without internal authenticity token, So we need to add the token where form submit action take place.
```ruby
<%= form_for :question, url: '/questions', html:{class:'form-horizontal'} do %>
 #......
  # form code
 #.....
<% end %>
```
In this case, upon submitting the parent form we are trying to route the user to url questions.html.erb. You can verify that in the form action as mentioned below.
```html
<form class="form-horizontal" action="/questions" method="POST">
```

### 3. Model

View <-- Controller ( gets data from model ) <-- Model ( talks to tables ) <-- Data Table

The default data structure to save the data in Rails is called `Model` and the librabry to interact with the model is called `Active Record`. So active records provide methods for creating, saving, querying and deleting the data in database without need of SQL statements ( no Rails application can be independent of the database implementation ).

step 1:
```ruby
rails g resource <modal_name> <list of data-tpe in name:type> #format
rails g resource question email:string body:text
```

After executing the above command we can see question appropriate files are generated in few folders,
```ruby
create db/migrate/20171024040928_create_questions.rb #script to create database
create app/models/question.rb
create app/controllers/questions_controller.rb
create app/helpers/questions_helper.rb
route    resources :questions   #helps to route the page
```
So what does the `migrate` directory script do ? Migrate script prefixed with timestamp to show when the migration command was generated, which consist of `change` method to `create_table` in the database with specified columns in the resource command. If we take close look at the migrate script we will also find rails added column for `timestamp` which will inturn create `created_time`and `update_time`columns as `created_at` and `updated_at` respectively.

> Rails uses the linguistic convention to create table as the table names will be in plural though the generate resource was issued with singualr model name. For example: The model can have many entities inside the table so plural.

step 2:
creating the table which refers above script
```ruby
rake db:migrate #created table.
```

step 3:
opening the console for data view and addition
```ruby
rails console #opens rails console helps to access tables via model.
```

step 4:
preping the data
```ruby
Question.count # querying the table
Question.create email: 'mahesh1@gmail.com', body: 'How old is the universe ?' #adding record
Question.count # querying the table again
```

step 5:
accesing the model in controller ( example: HomeController )
```ruby
def method_name
    @questions = Question.all
    #@questions = Question.order(created_at: :desc).all  #if we want to order the data
end
```

step 6:
display the data in the view
```ruby
<% @questions.each do |q| %>
  <div class="media">
      <h4 class="media-heading"><%= q.email %> asked :</h4><p><%= q.body %></p>
  </div>
<% end %>
```

step 7:
We can use few useful active record methods to retrive data from the database.
```ruby
Question.find
Question.find_by(columnname: "value") #hash with symbols
Question.first
Question.all
rails generate migration add_index_to_tablenamewithplural_columnname #index creation in database and will create migrate script under db folder. Then we need to update the `change` method in this new file with `add_index :tablenamewithplural, :columnname, unique: true`. Once done `rails db:migrate` has to be re-run again.
```

### 4. Routes

[READ THIS](http://guides.rubyonrails.org/routing.html)

Routes in ruby is pretty confusing if we atleast don't know the flow. It was a rough jounery juggling between `erb`, `haml` and then understand how the route actually work. So below are the few tricks we can use while working with routes.

View:
```ruby
form_tag(admin_foodvendor_upload_path, method: :post, enctype: 'multipart/form-data', id: 'foodvendor_upload_form') do
```
the first parameter for form_tag is nothing but actions=" " in normal html forms. If you have already installed rails project then navigate inside the project `cd app_name`. where app_name can be your project name. Now let the rails figure out the path for us.

```ruby
> rails console #brings rails console
> app.admin_foodvendor_upload_path  #copy the path from form_tag
=> "/admin/foodvendor_upload"  #ah ah so we almost figured out the path but the last part `_path`. where did that come from.
```

or
```ruby
rake routes # will give routes and controller#actions details
```

looking at the [2.3 Path and URL Helpers](http://guides.rubyonrails.org/routing.html) we can conclude `_path` are handled by rails helper.
```html
Creating a resourceful route will also expose a number of helpers to the controllers in your application. In the case of resources :photos:

photos_path returns /photos
new_photo_path returns /photos/new
edit_photo_path(:id) returns /photos/:id/edit (for instance, edit_photo_path(10) returns /photos/10/edit)
photo_path(:id) returns /photos/:id (for instance, photo_path(10) returns /photos/10)

Each of these helpers has a corresponding _url helper (such as photos_url) which returns the same path prefixed with the current host, port and path prefix.
```

Routes (config/routes.rb):
```ruby
resources :foodvendors, constraints: { id: /[^\/]+/ }
    post 'foodvendor_upload' => 'foodvendors#upload'  #tada path is pointing to controller foodvendors and method upload ( Controller#Action syntax ).
```
the resource routes in rails maps the request to actions in single controller defined matching with the resource.

Controller:
```ruby
class Admin::FoodvendorsController < Admin::BaseController
  def upload
    .. some caltulations ..
    redirect_to admin_foodvendors_path
  end
```

### 5. Forms

If we want to capture data of the form in single object then we need to capture the name property of the form in an array format.
```html
<textarea class="form-control" name="body"></textarea>
<input type="text" name="subject" required></input>
```
can we re-written as
```ruby
<textarea class="form-control" name="application[body]"></textarea>
<input type="text" name="application[subject]" required></input>
```
Now the resulting data capture will be with in one parent object application as `"application" => {"body" => "user entered value", "subject" => "user entered subject"}`

Capture Param:     
Lets create a from inside new.html.erb which will inturn call `create` action in the controller ( this is the magic done by rails ).
```ruby
<%= form_for :post, url: school_path do |f| %>
  <p>
    <%= f.label :title %> <br>
    <%= f.text_field :title %>
  </p>

  <p>
    <%= f.label :body %><br>
    <%= f.text_area :body %>
  </p>

  <p>
    <%= f.submit %>
  </p>

<% end %>
```
Now we can add method `ceate` inside `school` controller. ( url: school_path tells us where we are rounting to). But make sure the router.rb has path setup as well.

```ruby
//SchoolController aka school
def create
  render plain: params[:post].inspect
  #{"title"=>" value entered", "body" => " value added"} will be displayed
end
```


Link:
```ruby
<%= link_to "Home", home_path %>
<%= link_to "NameOfTheLink", URLPATH, OPTIONALHASH %> #Syntax
```
We are editing in application.html.erb. In above example "Home" is name of the link will be displayed and `home_path` will be the route it will go to. We can route root path to home as alias as shown below, so upon clicking the link it will go to main index page.
```ruby
root 'schools#index', as : 'home'
#root 'controller_name#action', alias as : 'home'
```
Similarly,
```ruby
<%= link_to "Create", new_school_path %>
```
will result in routing to `/schools/new`.

#### 6. Debugger

Add `debugger` inside the controller or Module or Helper methods where the problem needs to be investigated and upon loading the application `byebug` console will be enabled to interact with the the data set.

### Examples:
| # | Description | Example Link |
| --- | --- | --- |
| 1 | find duplicates between two arrays (list of hash) and build new arrays for update and/or create  | [Array Duplication between Arrays](https://github.com/citta-lab/ruby/blob/master/ruby_code/array_duplication_between_arrays.rb) |
| 2 | --- | --- |




### Reference:
1. [LaunchSchool](https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1)
2. Ruby Fundamentals by Alex Korban
3. Need to add
