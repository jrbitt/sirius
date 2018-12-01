extends TextureButton

var clicked = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		clicked = !clicked
		print("Clicked")
	
	if clicked:
		$p1.modulate = Color(0.212,0.447,1,1)
	else:
		$p1.modulate = Color(1,1,1,1)

func _ready():
	set_process_input(true)