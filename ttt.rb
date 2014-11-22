
  def two_in_a_row(hsh, mrkr) #checks to see if two in a row
    if hsh.values.count(mrkr) == 2
     hsh.select{|k,v| v == nil}.keys.first  
    else
      false
    end
  end

  def three_in_a_row_player(hsh, mrkr) #checks if player has three in a row
    if hsh.values.count(mrkr) == 3
       puts "Player Wins!"
       true
    else
      false
    end
  end

grid_hash = {1=>nil,2=>nil,3=>nil,4=>nil,5=>nil,6=>nil,7=>nil,8=>nil,9=>nil} #initial nil values

puts " #{grid_hash[1]} | #{grid_hash[2]} | #{grid_hash[3]} \n___________\n #{grid_hash[4]} | #{grid_hash[5]} | #{grid_hash[6]} \n___________\n  #{grid_hash[7]} | #{grid_hash[8]} | #{grid_hash[9]} \n "

loop do 

  player_marker = 'x'
  computer_marker = 'O'
  check_for_space = '' #used with two_in_a_row method
  flag = 0 #0 indicates not processed by block
  
  puts "Choose a position from 1 to 9 to place a piece:"

  player_select = gets.chomp.to_i

  grid_hash[player_select] = 'x'

  first_row = {1=>grid_hash[1],2=>grid_hash[2],3=>grid_hash[3]}
  second_row = {4=>grid_hash[4],5=>grid_hash[5],6=>grid_hash[6]}
  third_row = {7=>grid_hash[7],8=>grid_hash[8],9=>grid_hash[9]}
  first_column = {1=>grid_hash[1],4=>grid_hash[4],7=>grid_hash[7]}
  second_column = {2=>grid_hash[2],5=>grid_hash[5],8=>grid_hash[8]}
  third_column = {3=>grid_hash[3],6=>grid_hash[6],9=>grid_hash[9]}
  t_left_b_right = {1=>grid_hash[1],5=>grid_hash[5],9=>grid_hash[9]}
  b_left_t_right = {7=>grid_hash[7],5=>grid_hash[5],3=>grid_hash[3]}

  grid_array = [first_row, second_row, third_row, first_column, second_column, third_column, t_left_b_right, b_left_t_right]

  grid_array.each do |line|
      if three_in_a_row_player(line, player_marker)
         flag = 1 #game ends when flag = 1
         break
      end
  end

  if flag == 0
    grid_array.each do |line|
      if check_for_space = two_in_a_row(line, computer_marker) 
        grid_hash[check_for_space] = 'O' #checks for two 'O' and then places the third 'O'
        puts "Computer Wins!" 
        flag = 1 #game ends when flag = 1
        break
      end
    end
  end 

  if flag == 0
    grid_array.each do |line|
      if check_for_space = two_in_a_row(line, player_marker) #checks two in a row player markers
         grid_hash[check_for_space] = 'O' #blocks player with computer marker
         flag = 2
         break
      end
    end
  end

  if flag == 0 && grid_hash.values.include?(nil) #choose vacant space at random
    begin
      grid_hash_random_keys = grid_hash.keys.sample
      grid_hash_random_nil_value = grid_hash[grid_hash_random_keys]
    end while grid_hash_random_nil_value !=nil #loop until it finds a random nil value in hash
      grid_hash[grid_hash_random_keys] = 'O' 
  end

  puts " #{grid_hash[1]} | #{grid_hash[2]} | #{grid_hash[3]} \n___________\n #{grid_hash[4]} | #{grid_hash[5]} | #{grid_hash[6]} \n___________\n  #{grid_hash[7]} | #{grid_hash[8]} | #{grid_hash[9]} \n "

  if !(grid_hash.values.include?(nil)) || flag == 1
    break
  end

end 

puts "Thanks for playing!"

  
  


