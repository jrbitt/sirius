extends Node2D

onready var player_scene = preload("res://addons/turns/Player.tscn")

var name_perso = ""

func _ready():
	$name.text = name_perso
	
func _on_next_pressed():
	var p = player_scene.instance()
	p.player_name = name_perso
	GlobalGames.get_node("players").add_child(p)
	get_tree().change_scene("res://games/game1/Game1.tscn")
	
func _on_Keyboard_key_pressed(k):
	if name_perso.length()==9:
		if k == "back":
			name_perso = name_perso.substr(0,name_perso.length()-1)
			$name.text = name_perso
			return
		else:
			return
	else:
		if k == "space":
			name_perso = name_perso + " "
		elif k == "back":
			if name_perso.length() > 0:
				name_perso = name_perso.substr(0,name_perso.length()-1)
		else:
			name_perso = name_perso + k
		$name.text = name_perso
