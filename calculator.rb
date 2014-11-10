puts "Enter first number"

a = gets.chomp

puts "Enter second number"

b = gets.chomp

puts "Enter '1' to add, '2' to substract, '3' to multiply, or '4' to divide "

operator = gets.chomp

if operator == '1'
  puts "#{a.to_f + b.to_f}"
  elsif operator == '2'
    puts "#{a.to_f - b.to_f}"
  elsif operator == '3'
    puts "#{a.to_f * b.to_f}"
  else operator == '4'
    puts "#{a.to_f / b.to_f}"
end
