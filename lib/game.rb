require 'pry'

class Game 
  attr_accessor :human_player, :enemies

  def initialize(player)
    @human_player = HumanPlayer.new(player)
    @enemies = [Player.new("Lara"), Player.new("Raphaël"), Player.new("Lisa"), Player.new("Richard")]
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    return @human_player.life_points > 0 && @enemies.lenght > 0 ? true : false
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.lenght} ennemis"
    puts "-----------------------------------"
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "---------------------------------"
    puts "Attaquer un joueur en vue :"
      
        
  end

  def menu_choice(string)
    if string == "a"
      @human_player.search_weapon
    end
    if string == "s"
      @human_player.search_health_pack
    end
    if string == "0" || string == "1" || string == "2" || string == "3"

    end
  end







end

      