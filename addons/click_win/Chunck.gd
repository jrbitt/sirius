
extends Sprite

export(String) var name = "Name" setget _set_name

func _set_name(n):
	name = n

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

