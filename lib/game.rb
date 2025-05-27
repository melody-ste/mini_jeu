

class Game 

  attr_accessor :human_player, :enemies

  def initialize(human_name)
    @human_player = HumanPlayer.new(human_name)
    @enemies = [
      Player.new("Josiane"),
      Player.new("José"),
      Player.new("Wolverine"),
      Player.new("Deadpool")
    ]
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty?
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@enemies.count} joueurs en vie."
  end
  
  def menu
    puts "\nQuelle action veux-tu effectuer ?\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nattaquer un joueur en vue :"
    @enemies.each_with_index do |enemy, index|
      puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie" if enemy.life_points > 0
    end
  end

  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon
    elsif choice == "s"
      @human_player.search_health_pack
    elsif choice.to_i.to_s == choice && @enemies[choice.to_i]
      target = @enemies[choice.to_i]
      if target.life_points > 0
        @human_player.attacks(target)
        kill_player(target) if target.life_points <= 0
      else
        puts "Ce joueur est déjà mort !"
      end
    else
      puts "Choix invalide !"
    end
  end

  def enemies_attack
    puts "\nLes autres joueurs t'attaquent !\n" unless @enemies.empty?
    @enemies.each do |enemy|
      enemy.attacks(@human_player) if enemy.life_points > 0
    end
  end

  def end
    puts "\nLa partie est finie"
    if @human_player.life_points > 0
      puts "\nC'est gagné !"
    else
      puts "\nPerdu.. réessaye"
    end
  end

end