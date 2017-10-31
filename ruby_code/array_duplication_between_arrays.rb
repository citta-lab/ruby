ref_data = {
  "newtest": [
    {
      "id": "1",
      "name": "IphoneX",
      "key": "IphoneX"
    },
    {
      "id": "2",
      "name": "Iphone8Plus",
      "key": "Iphone8Plus"
    },
    {
      "id": "3",
      "name": "AppleWatch3",
      "key": "AppleWatch3"
    },
    {
      "id": "4",
      "name": "SamsungS8",
      "key": "SamsungS8"
    },
    {
      "id": "5",
      "name": "SamsungS7",
      "key": "SamsungS7"
    }
  ]
}

check_data = [
    {
      "name": "AppleWatch3",
      "key": "AppleWatch3"
    },
    {
      "name": "SamsungS7",
      "key": "SamsungS7"
    },
    {
      "name": "Nokia6600",
      "key": "Nokia6600"
    }
]

update_array = [ ]
check_array = check_data
ref_data[:newtest].each do |e|
  check_data.map do |x|
    if e[:key] == x[:key]
      update_array.push e
      check_array.delete(x)
    end
  end
end

if !update_array.empty? && update_array.length > 0
  puts "call update "
  puts update_array
end

puts "******"

if !check_array.empty? && check_array.length > 0
  puts "call create"
  puts check_array
end
