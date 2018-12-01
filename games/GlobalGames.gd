extends Node

func _winners():
	var ret = []
	var score = $players._get_best()._get_score()
	var wins = $players._is_draw(score)
	for w in wins:
		ret.append(w._get_player_name())
	return ret
