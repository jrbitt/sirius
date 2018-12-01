extends HBoxContainer

func _on_players_new_turn(player):
	$playerName.text = player._get_player_name()
	if player._get_avatar() != null:
		$avatar.texture = player._get_avatar()
	$score.text = str(player._get_score())

func _on_game_update_score(value):
	$score.text = str(value)
