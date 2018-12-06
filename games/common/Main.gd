extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	GlobalGames._reset()

func _on_game1_clicked(descr, ind):
	get_tree().change_scene("res://games/common/NumberPlayers.tscn")


func _on_creditos_clicked(descr, ind):
	get_tree().change_scene("res://games/common/Credits.tscn")
