extends Node2D


func _ready():
	$secret_word.word = "Macaco".to_upper()
	
	$tokens._choice_elements()

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
