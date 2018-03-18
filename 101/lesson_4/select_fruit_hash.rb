# select_fruit_hash.rb

# In this example we want to select the key-value pairs where the value
# is 'Fruit'.

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# How would you implement a method like this?

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
 keys = produce.keys
 output = {}
 counter = 0
 loop do
   # this has to be at the top in case produce_list is empty hash
   break if counter == produce.size
   current_key = keys[counter]

   if produce[current_key] == 'Fruit'
     output[current_key] = produce[current_key]
   end

   counter += 1
 end
 output
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# LS solution:
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end