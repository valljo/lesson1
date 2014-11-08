a = 5
c = 8

1.times do |n|
  a = 3
  b = 5      # b is initialized in the inner scope
  b = "abc"
  b.upcase
  puts b
  b.upcase!
  puts b

  1.times do |n|
    c = 4 #accessing defined variable at outerscope
    d = 5     
  end
  #puts c #undefined local variable.
end

puts a

#puts b #undefined local variable.

puts c #defined in the outer scope which is accessible by inner scope blocks
