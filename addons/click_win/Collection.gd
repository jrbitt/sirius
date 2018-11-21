extends Node2D

export(int) var num_elements = 3

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum State{READY, ELEMENTS} 

var max_tokens = 0
var state = READY
var indexes = []

func _ready():
	self.visible = false
	randomize()
	max_tokens = get_child_count()

func _choice_elements():
	if state == READY:
		state = ELEMENTS
		indexes.clear()
		var c = 0
		while c != num_elements:
			var r = randi() % max_tokens
			if indexes.bsearch(r) == -1:
				indexes.append(r)
				c = c + 1
				
func _get_element(i):
	if state == ELEMENTS:
		return get_child(indexes[i])
	else:
		return null