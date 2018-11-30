extends Control

func _on_color_buttons_changed_color(index):
	var p1 = 1 + (4*index)
	var p2 = 3 + (4*index)
	var p3 = 0 + (4*index)
	var p4 = 2 + (4*index)
	$p2.frame = p1
	$p4.frame = p2
	$p1.frame = p3
	$p3.frame = p4
