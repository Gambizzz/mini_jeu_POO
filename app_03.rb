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

my_game = Game.new(your_name)
while my_game.is_still_ongoing?
  