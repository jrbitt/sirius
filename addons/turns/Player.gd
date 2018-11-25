extends Node2D

export(String) var player_name = "Default" setget _set_player_name,_get_player_name
export(int) var color = -1  setget _set_color,_get_color
export(Texture) var avatar = null  setget _set_avatar,_get_avatar

var score = 0
var errors = 0
var wins = 0

func _add_score(v):
	score = score + v
	
func _add_error(v):
	errors = errors + v
	
func _add_wins(v):
	 wins = wins + v
	
func _get_score():
	return score
	
func _get_errors():
	return errors
	
func _get_wins():
	return wins
	
func _set_player_name(v):
	player_name = v

func _get_player_name():
	return player_name
	
func _set_color(v):
	color = v

func _get_color():
	return color
	
func _set_avatar(v):
	avatar = v
	if has_node("sprite"):
		$sprite.texture = avatar

func _get_avatar():
	return avatar

func _ready():
	pass