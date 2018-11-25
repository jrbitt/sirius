extends Area2D

export(String) var description = "Name" setget _set_description, _get_description

signal clicked(descr)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		emit_signal("clicked",description)

func _set_description(d):
	description = d

func _get_description():
	return description

func _ready():
	set_process_input(true)