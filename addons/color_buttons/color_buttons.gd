extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal changed_color(index)

func _ready():
	var i = 0
	for c in get_children():
		c._set_index(i)
		i = i + 1
		c.connect("clicked",self,"on_clicked")
		
func on_clicked(desc,ind):
	emit_signal("changed_color",ind)
	