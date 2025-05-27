require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "_________________________________________________\n"
puts "| Bienvenue sur ' Ils VEULENT TOUS MA POO' !    |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "_________________________________________________"

#joueurs

puts "Comment tu t'appelle ?"
print ">"
user_name = gets.chomp
user = HumanPlayer.new(user_name)


player1 = Player.new("Josiane")
player2 = Player.new("José")
players = [player1, player2]

#combat

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

  puts "_________________________________________________\n"
  puts "Tu as :"
  user.show_state
  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  players.each_with_index do |player, index|
    puts "#{index} - #{player.name} a #{player.life_points} points de vie" if player.life_points > 0
  end
  puts "_________________________________________________\n"
  print "> "
  action = gets.chomp
  
  #tour humain

  if action == "a"
    user.search_weapon
  elsif action == "s"
    user.search_health_pack
  elsif action == "0" && player1.life_points > 0
    user.attacks(player1)
  elsif action == "1" && player2.life_points > 0
    user.attacks(player2)
  else
    puts "Action invalide ou joueur déjà mort !"
  end

  #tour bot
  
  players.each do |player|
    if player.life_points > 0
      puts "_________________________________________________\n"
      puts "\nLes autres joueurs attaquent..." 
      player.attacks(user)
    end
  end
end

puts "\nLa partie est finie"
if user.life_points > 0
  puts "\nC'est gagné ! "
else
  puts "\nPerdu..réessaye "
end


# binding.pry