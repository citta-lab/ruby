Ruby [ juggling pebbles ]
--------------------------
Learning new language is always exciting and overwhelming, I have heard a lot about simplicity of `ruby` but never had an opportunity to work until now. So thought i will make an effort to learn, embrace the language.

Playground: [repl it](https://repl.it/languages/ruby)

### 1. Introduction ( parts unknown )

I have had an opportunity to work on `java`, `angular`, `shell`, `javascript` and lately started to learn `react`. The syntax to `ruby` seems to be much more simpler than all of the above and yet embraced widely.

(i). Variables are private and cannot be accessed directly outside of the class.
(ii). Methods inside the class are public.
(iii). Methods doesn't need to have explicit `return` for returning the method call.
(iv). Constructors are defined by declaring `initialize` method inside the class.
(v). Variable doesn't need to have `type` declaration. Example: In java `int value = 10;` assigns int type to value. In ruby we can simply say `value = 10`.

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
