############################################################################################
# Step 1: ref_data has has one key of value array. This can be exisitng data in the database
# or file of any sort.
############################################################################################

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

############################################################################################
# Step 2: check_data list of array will be user uploaded file which needs to be added to the
# database if hash doesn't exisit in the ref_data already, if it does then it needs to be
# updated.
############################################################################################

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

############################################################################################
# Step 3: Build logic to loop both arrays to find existing records for update and
# new records to add. Will be building two new arrays one for update ( i.e update_array) and
# one for creation (i.e check_array) to hold new values.
############################################################################################
update_array = [ ]
check_array = check_data
ref_data[:newtest].each do |e|
  check_data.map do |x|
    if e[:key] == x[:key]   # check if updated file array element exist already
      e[:name] = x[:name]   # update the name from uploaded file
      update_array.push e   # created new array with all existing records to update
      check_array.delete(x) # clean-up the copy of update array to have just new element list
    end
  end
end

############################################################################################
# Step 4: Double verification process to determine if i have values in the array.
############################################################################################
if !update_array.empty? && update_array.length > 0
  puts "call update "
  puts update_array
end

puts "******"

if !check_array.empty? && check_array.length > 0
  puts "call create"
  puts check_array
end
