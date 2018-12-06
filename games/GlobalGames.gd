extends Node

var num_players = 0
var current_definition = 0
var start_game = false
var winners_name = []
var best_score = -1

func _reset():
	num_players = 0
	current_definition = 0
	start_game = false
	winners_name = []
	best_score = -1
	for p in $players.get_children():
		$players.remove_child(p)

func _winners():
	best_score = $players._get_best()._get_score()
	var wins = $players._is_draw(best_score)
	for w in wins:
		winners_name.append(w._get_player_name())
