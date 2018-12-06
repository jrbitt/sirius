extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	if GlobalGames.winners_name.size()>1:
		$message.text = "Empate"
	else:
		$message.text = GlobalGames.winners_name[0]+" venceu"
		
	$points.text= str(GlobalGames.best_score)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_voltar_clicked(descr, ind):
	get_tree().change_scene("res://games/common/Main.tscn")