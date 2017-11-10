### Arrays

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
2. each         
Similar to typical `for` loop iteration can be done via `each` in ruby on array and/or hash. The below example shows how the each iterator traverse through the items of the array. Each doesn't mutate the state of original array. If we need index of each item then we can also use `each_with_index`.
