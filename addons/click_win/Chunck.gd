extends Area2D

export(String) var description = "Name" setget _set_description, _get_description

signal clicked(descr,ind)

var enabled = true
var index = -1

func _set_index(i):
	index = i
	
func _set_enabled(v):
	enabled = v
	if not enabled:
		$sprite.modulate = Color(1,1,1,0.25)
	else:
		$sprite.modulate = Color(1,1,1,1)
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if enabled:
			emit_signal("clicked",description,index)

func _set_description(d):
	description = d

func _get_description():
	return description

func _reset():
	_set_enabled(true)
	index = -1
	visible = false

func _ready():
	set_process_input(true)