extends Node2D

export(int) var max_turns = 10

var current_index = 0
var max_players
var current_turn = 0

signal new_turn(player)

func _reset():
	current_index = 0
	current_turn =0
	
func _finish():
	return current_turn == max_turns
	
func _is_draw(value):
	var v = []
	for c in get_children():
		if c._get_score() == value:
			v.append(c)
	return v

func _get_best():
	var score = -100000
	var best = null
	for c in get_children():
		if c._get_score() > score:
			score = c._get_score()
			best = c
	return best
	
func _first_turn():
	emit_signal("new_turn", _get_current())
	
func _count_players():
	max_players = get_child_count()
	
func _ready():
	_count_players()

func _next():
	current_index = current_index + 1
	if current_index >= max_players:
		current_index = 0
		current_turn = current_turn + 1
	emit_signal("new_turn", _get_current())
	
func _get_current():
	return get_child(current_index)
