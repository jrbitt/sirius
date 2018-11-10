tool
extends Control

export(String) var key = "A" setget _set_key
export(Theme) var key_theme setget _set_theme
export(Texture) var normal_key setget _set_texture
export(bool) var special = false setget _set_special

signal key_pressed(t)

func _set_special(s):
	special = s
	if has_node("label"):
		$label.visible = not special
	
func _set_key(k):
	key = k
	if has_node("label"):
		$label.text = key
	update()
	
func _set_theme(t):
	theme = t
	if has_node("label"):
		$label.theme = theme
	update()
	
func _set_texture(t):
	normal_key = t
	if has_node("image"):
		$image.texture_normal = normal_key
	update()
	
func _ready():
	if not Engine.editor_hint:
		$image.texture_normal = normal_key
		_set_special(special)
		if not special:
			$label.text = key
			$label.theme = theme

func _on_image_button_up():
	emit_signal("key_pressed",key)
