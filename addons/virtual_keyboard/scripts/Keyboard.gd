extends Control

var string = ""

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func concatenar(t):
	string = string + t
	
func _on_b1_botao_pressionado(t):
	concatenar(t)
