extends MarginContainer

var key_scene = preload("res://addons/virtual_keyboard/scenes/Key.tscn")

export(String) var word = "" setget _set_word
export(int) var max_size = 10 setget _set_max_size
export(Texture) var back_texture setget _set_back_texture
export(Vector2) var back_dimension setget _set_back_dimension
export(Theme) var key_theme setget _set_theme
export(bool) var show_letters = false setget _set_show_letters
export(String) var character = '' setget _set_character

var string = ""

signal correct_secret_word(value)

func _set_character(c):
	character = c
	
func _set_show_letters(sl):
	show_letters = sl
	
func _set_theme(t):
	key_theme = t
	update()
	
func _set_back_texture(t):
	back_texture = t

func _set_back_dimension(d):
	back_dimension = d

func _set_word(w):
	word = w
	if not Engine.editor_hint:
		var limit = min(max_size,word.length())
		for i in range(limit):
			var k = key_scene.instance()
			k.normal_key = back_texture
			k.key_theme = key_theme
			k.key = character
			if has_node("line"):
				k.rect_min_size = back_dimension
				$line.add_child(k)
	
func _set_max_size(ms):
	max_size = ms

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _set_current_string(s):
	string = s
	if show_letters:
		for i in range(string.length()):
			$line.get_child(i).key = string[i]
	emit_signal("correct_secret_word",is_correct())
	
func reset():
	for k in $line.get_children():
		k.key = character

func is_correct():
	return word == string