extends "res://games/Game.gd"

var chunck = null
var current_player

signal update_score(value)

var btns = []
var players = null

func _turn():
	current_player = players._get_current()
	$tokens._reset()
	$tokens._choice_elements()
	btns.append($gui/buttons/button1)
	btns.append($gui/buttons/button2)
	btns.append($gui/buttons/button3)
	randomize()
	var r = randi() % $tokens._get_num_elements()
	chunck = $tokens._get_element(r)
	
	if chunck != null:
		chunck.global_position = $p1.position
		chunck.visible = true
		
	for i in range($tokens._get_num_elements()):
		var c = $tokens._get_element(i)
		btns[i]._set_index(i)
		btns[i]._set_enabled(true)
		btns[i]._set_description(c._get_description())

func _start():
	players = get_node("/root/GlobalGames/players")
	self.connect("update_score",$gui/header,"_on_game_update_score")
	players.connect("new_turn",$gui/header,"_on_players_new_turn")
	
	players._count_players()
	players._first_turn()
	_turn()
	
func _ready():
	if GlobalGames.start_game:
		_start()
	
				
func _on_buttons_clicked(description, index):
	if description == chunck._get_description():
		$leonardo.frame = 0
		current_player._add_score(5)
		emit_signal("update_score",current_player._get_score())
	else:
		if current_player._get_errors() == 4:
			GlobalGames._winners()
			get_tree().change_scene("res://games/common/EndGame.tscn")
		else:
			$leonardo.frame = 1
			current_player._add_score(-3)
			current_player._add_error(1)
			emit_signal("update_score",current_player._get_score())
			for i in range($tokens._get_num_elements()):
				if btns[i]._get_description() == description:
					btns[i]._set_enabled(false)
					break
		
	$gui/buttons.enabled = false
	$leonardo/animation.play("showing")

func _on_animation_animation_finished(anim_name):
	$gui/buttons.enabled = true
	if $leonardo.frame == 0:
		players._next()
		if not players._finish():
			_turn()
		else:
			GlobalGames._winners()
			get_tree().change_scene("res://games/common/EndGame.tscn")

#--------------------------------------------------
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