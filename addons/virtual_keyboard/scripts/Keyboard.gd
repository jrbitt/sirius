tool
extends Control

export(Texture) var normal_simple_key = null setget _set_texture
export(Theme) var key_theme setget _set_theme
var string = ""

onready var lines = $lines

signal key_pressed(k)
signal enter_pressed(s)

func _set_texture(t):
	normal_simple_key = t	
	if has_node("lines"):
		lines = $lines
		for c in lines.get_children():
			for b in c.get_children():
				if not b.special: 
					b.normal_key = normal_simple_key
	update()

func _set_theme(t):
	key_theme = t
	if has_node("lines"):
		lines = $lines
		for c in lines.get_children():
			for b in c.get_children():
				b.key_theme = key_theme
	update()
	
func _ready():
	if not Engine.editor_hint:
		for c in lines.get_children():
			for b in c.get_children():
				if not b.special:
					b.normal_key = normal_simple_key
				b.key_theme = key_theme
				b.connect("key_pressed",self,"on_key_pressed")

func concat(t):
	if t == "space":
		string = string + " "
	else:
		string = string + t
	
func _get_current_string():
	return string
	
func on_key_pressed(k):
	if k == "enter":
		emit_signal("enter_pressed",string)
		string = ""
	else:
		concat(k)
		emit_signal("key_pressed",k)
		