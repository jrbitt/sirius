extends Node2D

export(int) var num_elements = 3

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum State{READY, ELEMENTS} 

signal clicked(description,index)

var max_tokens = 0
var state = READY
var indexes = []
var enabled = true

func _set_enabled(v):
	enabled = v
	
func _ready():
	randomize()
	max_tokens = get_child_count()
	for c in get_children():
		c.connect("clicked",self,"on_clicked")

func _reset():
	state = READY
	for c in get_children():
		c._reset()

func _choice_elements():
	if state == READY:
		state = ELEMENTS
		indexes.clear()
		var c = 0
		while c != num_elements:
			var r = randi() % max_tokens
			if indexes.find(r,0) == -1:
				indexes.append(r)
				c = c + 1
				
func _get_element(i):
	if state == ELEMENTS:
		return get_child(indexes[i])
	else:
		return null
		
func on_clicked(descr,index):
	if enabled:
		emit_signal("clicked",descr,index)