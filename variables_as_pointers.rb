def test(b)
  p b.map! {|letter| "I like the letter: #{letter}"}
  p b
end

a = ['a', 'b', 'c']
test(a)

p a 

