def check_sum_of_card_values_in_hand(caller_hand_array) #returns sum of card values in hand
  card_value_counter_array = []
  card_value = 0
  caller_hand_array.each do |card_hash|
    card_hash.each do |k, v|
      
      if k == 1
        if card_value_counter_array.reduce(:+) < 11 
           card_value = 11 
        else 
           card_value = 1
        end
      end  

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

      card_value_counter_array << card_value #Accesses key value in hash and pushes into array
    end
  end
  p card_value_counter_array.reduce(:+)
end

array_player_hand = [{2=>"clubs"}, {8=>"hearts"}]


check_sum_of_card_values_in_hand(array_player_hand)


