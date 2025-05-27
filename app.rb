require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

#combat
while player1.life_points > 0 && player2.life_points > 0

  puts "Voici l'état de nos joueurs :"

  player1.show_state
  player2.show_state

  puts "______________________________"

  puts "\nPassons à la phase d'attaque :"

  # 1ere attaque

  player1.attacks(player2)

  if player2.life_points <= 0
    break
  end

  # 2eme attaque

  player2.attacks(player1)

end

# binding.pry