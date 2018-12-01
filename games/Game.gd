extends Node2D

export(String) var game_name
export(int) var min_players
export(int) var max_players
export(String) var authors
export(int) var max_turns 

enum GameState{ ACTVATED, PAUSED, FINISHED}

export(GameState) var game_state = ACTVATED

func _turn():
	pass