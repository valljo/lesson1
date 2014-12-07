
def check_if_deal_card_exists(card_deck_array, card_suits_array, cards_dealt_array, card_dealt, card_suit_dealt) 
   cards_dealt_array.each do |card|
     if card[card_dealt] && card.fetch(card_dealt) == card_suit_dealt
        return 1
      else
        return 0
     end
   end
end    

def check_sum_of_card_values_in_hand(caller_hand_array) #returns sum of card values in hand
  card_value_counter_array = []
  card_value = 0
  sum_of_card_values = 0
  caller_hand_array.each do |card_hash| 
    card_hash.each do |k, v|
      if (card_value_counter_array.reduce(:+) == nil) #checks if caller's hand is empty
        sum_of_card_values = 0
      else
        sum_of_card_values = card_value_counter_array.reduce(:+)
      end
      if k == 1
        if sum_of_card_values < 11
           card_value = 11
        else
           card_value = 1
        end
      end 
      if k != 1        
        case 
        when k == 11
          card_value = 10    
        when k == 12
          card_value = 10    
        when k == 13
          card_value = 10    
        else
          card_value = k
        end
      end
      card_value_counter_array << card_value #Accesses key value in hash and pushes into array
    end
  end
  return card_value_counter_array.reduce(:+)
end

def deal_card(array_card_deck, array_card_suits, array_cards_dealt, caller_hand_array)
  begin 
    card_has_been_dealt = 0  
    dealt_card = array_card_deck.sample
    dealt_card_suit = array_card_suits.sample 
    card_has_been_dealt = check_if_deal_card_exists(array_card_deck, array_card_suits, array_cards_dealt, dealt_card, dealt_card_suit)    
  end while card_has_been_dealt == 1 # Check if card has already been dealt
  caller_hand_array.push(dealt_card => dealt_card_suit) 
  array_cards_dealt.push(dealt_card => dealt_card_suit) 
end

array_card_deck = [1,2,3,4,5,6,7,8,9,10,11,12,13]
array_card_suits = ['hearts','diamonds','clubs','spades']
array_player_hand = []
array_dealer_hand = []
array_cards_dealt = []
player_choice = 0
flag_to_indicate_win = 0

2.times do # Deal player two cards at the start
  deal_card(array_card_deck, array_card_suits, array_cards_dealt, array_player_hand)  
end

2.times do # Deal dealer two cards at the start
  deal_card(array_card_deck, array_card_suits, array_cards_dealt, array_dealer_hand)  
end

puts "Welcome to Blackjack"
puts "Player cards:"
array_player_hand.each do |card_hash| 
  card_hash.each do |k, v|
    case 
      when k == 1
        puts "Ace of #{v}"
      when k == 11
        puts "Jack of #{v}" 
      when k == 12
        puts "Queen of #{v}"  
      when k == 13
        puts "King of #{v}" 
      else
        puts "#{k} of #{v}"
    end      
  end
end
players_hand_total = 0
players_hand_total = check_sum_of_card_values_in_hand(array_player_hand)
if players_hand_total == 21
        puts "Blackjack! Player wins!"
end
puts "Current value of player's hand: #{players_hand_total}"

puts "Dealer cards:"
array_dealer_hand.each do |card_hash| 
  card_hash.each do |k, v|
    case 
      when k == 1
        puts "Ace of #{v}"
      when k == 11
        puts "Jack of #{v}" 
      when k == 12
        puts "Queen of #{v}"  
      when k == 13
        puts "King of #{v}" 
      else
        puts "#{k} of #{v}"
    end      
  end
end
dealer_hand_total = 0
dealer_hand_total = check_sum_of_card_values_in_hand(array_dealer_hand)
if dealer_hand_total == 21
        puts "Blackjack! Dealer wins!"
end
puts "Current value of dealer's hand: #{dealer_hand_total}"

if (players_hand_total != 21 && dealer_hand_total != 21)
  begin
    puts "Player's turn..."
    puts "Player: Enter (1) to hit, or (2) to stay"
      player_choice = gets.chomp.to_i
      if player_choice == 1
        deal_card(array_card_deck, array_card_suits, array_cards_dealt, array_player_hand)  
        players_hand_total = check_sum_of_card_values_in_hand(array_player_hand)
        puts "Current value of player's hand: #{players_hand_total}"  
        if players_hand_total == 21
          puts "Blackjack! Player wins!"
          flag_to_indicate_win = 1
          break
        else
          if players_hand_total > 21
            puts "Player busts! Dealer wins!"
            flag_to_indicate_win = 1
            break
          end
        end
      end 
  end while player_choice == 1 

  if flag_to_indicate_win == 0
    while !(dealer_hand_total > 16)
      puts "Dealer's turn..."
      deal_card(array_card_deck, array_card_suits, array_cards_dealt, array_dealer_hand)
      dealer_hand_total = check_sum_of_card_values_in_hand(array_dealer_hand)  
      puts "Current value of dealer's hand: #{dealer_hand_total}" 
      if dealer_hand_total == 21
        puts "Blackjack! Dealer wins!"
        flag_to_indicate_win = 1
        break
        else
         if dealer_hand_total > 21
            puts "Dealer busts! Player wins!"
            flag_to_indicate_win = 1
            break
         end
      end
    end
  end
  
  if flag_to_indicate_win == 0
    if players_hand_total == dealer_hand_total
      puts "Player and dealer tie!"
    else
      if players_hand_total > dealer_hand_total && players_hand_total < 21
        puts "Player wins!"
        else
        puts "Dealer wins!"
      end
    end
  end
end





