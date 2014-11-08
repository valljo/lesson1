def method_name(array)
  array.map! { |num| num**2 }
  puts "Hip Hip #{array}!" 
end


a = [1,2,3,4]

puts "#{a}"

method_name(a)

puts "Hip #{a}!" #a is now the mutated array in method_name