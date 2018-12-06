extends Node2D

var game = null
var min_p = 0
var max_p = 0
var players = 0
var line = ""

func _on_next_pressed():
	GlobalGames.num_players = players
	get_tree().change_scene("res://games/common/SelectCharacter.tscn")

func _ready():
	game = GlobalGames.get_node("/root/GlobalGames/games/Game1")
	min_p = game.min_players
	max_p = game.max_players
	$players.text = "De "+str(min_p)+" à "+str(max_p)+" jogadores"


func _on_Keyboard_key_pressed(k):
	if k == "back":
		line = ""
	else:
		line = k
		var num = int(line)
		if num >= min_p and num<=max_p:
			players = num
			$values.text = line
