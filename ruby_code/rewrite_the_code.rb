### This section will emphasize on rewritting the code for conciseness

1. Loop condition check
```ruby
send_data_sheet = [ ]
keys.each do |key|
  initial_data.each do | value |
    if ( key == value["key"])
      send_data_sheet.push(value)
      break
    end
  end
end
```
can be rewritten as below with one liner
```ruby
send_data_sheet = [ ]
keys.each do |key|
  initial_data.each { |value| keys.include?(value['key']); send_data_sheet.push(value); break }
end
```
