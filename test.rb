array_test = [{9=>"hearts"}, {10=>"clubs"}, {3=>"clubs"}, {4=>"hearts"}, {2=>"diammonds"}, {8=>"spades"}, {1=>"spades"}, {7=>"spades"}, {7=>"spades"}, {9=>"hearts"}]



array_test.each do |c|

a = 10
b = 'clubs'

  if c[a] && c.fetch(a) == b
    p "exists!"
    p c[a]
  end

p "hi!"

end