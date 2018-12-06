extends Node2D

onready var player_scene = preload("res://addons/turns/Player.tscn")

var name_perso = ""

func _ready():	
	var spr = get_node("/root/GlobalGames/players").get_child(GlobalGames.current_definition).get_node("sprite")
	get_child(GlobalGames.current_definition)
	$p1.texture = spr.texture 
	$p1.vframes = spr.vframes
	$p1.hframes = spr.hframes
	$p1.frame = spr.frame
	$name.text = name_perso
	
func _on_next_pressed():
	var p = get_node("/root/GlobalGames/players").get_child(GlobalGames.current_definition)
	p._set_player_name(name_perso)
	
	var nc = GlobalGames.get_node("players").get_child_count()
	
	if GlobalGames.num_players != nc:
		GlobalGames.current_definition = GlobalGames.current_definition + 1
		get_tree().change_scene("res://games/common/SelectCharacter.tscn")	
	else:
		GlobalGames.start_game = true
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
