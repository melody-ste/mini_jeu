
class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage_received = compute_damage
    player.gets_damage(damage_received)
    puts "Il lui inflige #{damage_received} points de dommages"

  end

  def compute_damage
   return rand(1..6)
  end

end


#joueur humain

class HumanPlayer < Player 

  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
  rand(1..6) * @weapon_level
  end

  def search_weapon
   new_weapon = rand(1..6)

   puts " tu as trouvé une arme de niveau #{new_weapon}"
  
    if new_weapon > @weapon_level
      @weapon_level = new_weapon

      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else 
     puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end

  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1
     puts "Tu n'as rien trouvé..."

    elsif health_pack >= 2 && health_pack <= 5
     puts "Bravo tu as trouvé un pack de +50 points de vie !"
     @life_points += 50
     @life_points = 100 if @life_points > 100

    else 
      puts "Wouaw, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
      @life_points = 100 if @life_points > 100
    end

  end
  
end

