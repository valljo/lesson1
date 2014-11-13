def player_choice(play) #Choice of player
  case play
  when 'p'
    play = 1
  when 's'
    play = 2
  when 'r'
    play = 3
  end
end

def print_choice(play) #Print choice
  case play
  when 1
    "Paper"
  when 2
    "Scissors"
  when 3
    "Rock"
  end
end

def print_result(choice, computer_play) #Print result
  player_play = player_choice(choice) #Returns a number based on selected
  player_tool = print_choice(player_play) #Prints what the player selected
  computer_tool = print_choice(computer_play) #Prints what the computer selected

  puts "You picked #{player_tool} and computer picked #{computer_tool}."

  result = case
    when player_play == 1 && computer_play == 3 #Player paper over rock
      "Paper wraps Rock!\nYou won!"
    when player_play == 2 && computer_play == 1 #Player scissors over paper
      "Scissors cuts Paper!\nYou won!"
    when player_play == 3 && computer_play == 2 #Player rock over scissors
      "Rock smashes Scissors!\nYou won!" 
    when player_play == 3 && computer_play == 1 #Computer paper over rock
      "Paper wraps Rock!\nComputer won!"
    when player_play == 1 && computer_play == 2 #Computer scissors over paper
      "Scissors cuts Paper!\nComputer won!"
    when player_play == 2 && computer_play == 3 #Computer rock over scissors
      "Rock smashes Scissors!\nComputer won!"
    when player_play == computer_play 
      "It's a tie."
    end
end


begin
  choice = ''
  play_again = ''
  puts "Play Paper Rock Scissors!"
  loop do
    puts "Choose one: (P/R/S)"
    choice = gets.chomp
    if (choice == 'p') || (choice == 'r') || (choice == 's') #Validation
      break
    end
  end  
  computer_play = rand(1..3)
  puts print_result(choice, computer_play)
  loop do
    puts "Play again? (Y/N)"
    play_again = gets.chomp
    if (play_again == 'y' || play_again == 'n') #Validation
       break
    end
  end
end while play_again == 'y'



