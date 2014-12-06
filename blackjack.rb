#blackjack is sum of all cards equals 21
player is dealt two cards at start of game
dealer is dealt two cards at start of game
face cards are worth the value shown
suit cards are worth 10
aces are worth 11 or 1

player is asked if to hit or stay.
  if hit, then deal card
    if the player's cards sum to be greater than 21, then player is bust
    if the player's cards sum to be 21, then the player wins
    if the sum is less than 21, then the player can choose to hit or stay
      if player chooses hit, then repeat the above, otherwise the player stays
       and the total value of the player's cards is calculated

The above steps are repeated for the dealer. Dealer must keep hitting to get at least 17.

If player and dealer are less than 21, then compare the value of their cards. Whoever's card values is highest is the winner

Deck of cards:
- 52 cards
- 4 suits; Hearts, Diamonds, Clubs, Spades
- 2,3,4,5,6,7,8,9,10,Jack,Queen,King,Ace
- Ace = 1 or 11

Array
Hash
Array of hashes
Hashes of arrays

Example:
hearts_array = [2,3,4,5,6,7,8,9,10,Jack,Queen,King,Ace]
