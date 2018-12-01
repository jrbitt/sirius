extends Area2D

export(String) var description = "Name" setget _set_description, _get_description

signal clicked(descr,ind)

var enabled = true
var index = -1

var selected = false
var fail = false

func _is_failed():
	return fail
	
func _is_selected():
	return selected
	
func _set_selected(v):
	selected = v
	if selected:
		$selected.visible = true
		$sprite.visible = false
		$fail.visible = false
	else:
		$selected.visible = false
		$sprite.visible = true
		$fail.visible = false
	
func _set_fail(v):
	fail = v
	if fail:
		$selected.visible = false
		$sprite.visible = false
		$fail.visible = true
	else:
		$selected.visible = false
		$sprite.visible = true
		$fail.visible = false
	
func _set_index(i):
	index = i
	
func _set_enabled(v):
	enabled = v
	if not enabled:
		modulate = Color(1,1,1,0.25)
	else:
		modulate = Color(1,1,1,1)
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if enabled:
			emit_signal("clicked",description,index)

func _set_description(d):
	description = d
	if has_node("title"):
		$title.text = description

func _get_description():
	return description

func _get_sprite():
	if selected:
		return $selected
	elif fail:
		return $fail
	else:
		return $sprite
	
func _reset():
	_set_enabled(true)
	index = -1
	visible = false

func _ready():
	$title.text = description
	set_process_input(true)