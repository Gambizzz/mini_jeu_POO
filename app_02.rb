require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
	|Bienvenue sur 'SAUVE QUI POO' !|
	|Le but du jeu est d'être le dernier survivant !|
	-------------------------------------------------"

puts "Quel est ton prénom ?"
print "> "
your_name = gets.chomp
you = HumanPlayer.new(your_name)
puts "Bienvenue #{your_name} !"
puts "-------------"

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = []
enemies << player1
enemies << player2

while you.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts
  puts "Voici TON état :"
  you.show_state
  puts "---------------------------------"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "---------------------------------"
  puts "Attaquer un joueur en vue :"
  puts "0 - Josiane a #{player1.life_points} points de vie"
  puts "1 - José a #{player2.life_points} points de vie"
  if player1.life_points <= 0
    puts "#{player1.name} est moooort !"
  end
  if player2.life_points <= 0
    puts "#{player2.name} est moooort !"
  end
  puts "---------------------------------"

  choice = gets.chomp
  if choice == "a"
    you.search_weapon
  elsif choice == "s"
    you.search_health_pack
  elsif choice == "0" && player1.life_points > 0
    you.attacks(player1)
  elsif choice == "1" && player2.life_points > 0
    you.attacks(player2)
  end

  puts "---------------------"
  puts "Les autres joueurs t'attaquent"
    if player1.life_points > 0 && player2.life_points > 0
      enemies.each do |enemy|
        if enemy.life_points > 0
          enemy.attacks(you)
        end
      end
    end
end
puts "-----------------------------------------------------------"

puts "LA PARTIE EST FINIIIIIIE"
if you.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ !"
else you.life_points <= 0
  puts "LOSER ! TU AS PERDU..."
end

#binding.pry