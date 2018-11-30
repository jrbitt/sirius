extends "res://games/Game.gd"

var chunck = null
var current_player

signal update_score(value)

func _turn():
	current_player = $players._get_current()
	$tokens._reset()
	$tokens._choice_elements()
	randomize()
	var r = randi() % 3
	chunck = $tokens._get_element(r)
	
	if chunck != null:
		chunck._get_sprite().global_position = $p1.position
		
	for i in range(3):
		var c = $tokens._get_element(i)
		c._set_index(i)
		c.visible = true
		c.global_position = pts[i].position	

	
func _ready():
	#$secret_word.word = "Macaco".to_upper()
	self.connect("update_score",$Header,"_on_game_update_score")
	$players.connect("new_turn",$Header,"_on_players_new_turn")
	
	$players._first_turn()
	_turn()

func _on_Keyboard_enter_pressed(s):
	if $secret_word.is_correct():
		print("sucesso")
	else:
		$secret_word.reset()

func _on_keyboard_key_pressed(k):
	var s = $keyboard._get_current_string()
	$secret_word._set_current_string(s)

func _on_secret_word_correct_secret_word(value):
	if value:
		print("sucesso")

func _on_tokens_clicked(description,index):
	#Acertou
	if description == chunck._get_description():
		$leonardo.frame = 0
		current_player._add_score(5)
		emit_signal("update_score",current_player._get_score())
	else:
		if current_player._get_errors() == 4:
			print("game over")
			print("win")
			print($players._get_best()._get_player_name())
		else:
			$leonardo.frame = 1
			current_player._add_score(-3)
			current_player._add_error(1)
			emit_signal("update_score",current_player._get_score())
			$tokens._get_element(index)._set_enabled(false)
		
	$tokens.enabled = false
	$leonardo/animation.play("showing")

func _on_animation_animation_finished(anim_name):
	$tokens.enabled = true
	if $leonardo.frame == 0:
		$players._next()
		if not $players._finish():
			_turn()
		else:
			var score = $players._get_best()._get_score()
			var wins = $players._is_draw(score)
			for w in wins:
				print(w._get_player_name())
