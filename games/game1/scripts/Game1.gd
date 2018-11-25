extends Node2D

var pts = []

var chunck = null

func _turn():
	$tokens._choice_elements()
	pts.append($p1)
	pts.append($p2)
	pts.append($p3)
	randomize()
	var r = randi() % 3
	chunck = $tokens._get_element(r)
	if chunck != null:
		$nameInvention.text = chunck._get_description()
	for i in range(3):
		var c = $tokens._get_element(i)
		c.visible = true
		c.global_position = pts[i].position	

	
func _ready():
	#$secret_word.word = "Macaco".to_upper()
	$Header/playerName.text = $Player._get_player_name()
	$Header/score.text = str($Player._get_score())
	_turn()
	pass

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

func _on_tokens_clicked(description):
	if description == chunck._get_description():
		$leonardo.frame = 0
		$Player._add_score(5)
		$Header/score.text = str($Player._get_score())
	else:
		$leonardo.frame = 1
		$Player._add_score(-3)
		$Header/score.text = str($Player._get_score())
	$tokens.enabled = false
	$leonardo/animation.play("showing")

func _on_animation_animation_finished(anim_name):
	$tokens.enabled = true
