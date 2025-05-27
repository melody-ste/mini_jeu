require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "_________________________________________________\n"
puts "| Bienvenue sur ' Ils VEULENT TOUS MA POO' !    |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "_________________________________________________"


puts "Comment tu t'appelle ?"
print ">"
user_name = gets.chomp
my_game = Game.new(user_name)

# combat

while my_game.is_still_ongoing?
  
  puts "\n"
  my_game.show_players
  my_game.menu
  print "> "
  choice = gets.chomp
  my_game.menu_choice(choice)

  # Tour des ennemis

  my_game.enemies_attack if my_game.is_still_ongoing?
end


my_game.end