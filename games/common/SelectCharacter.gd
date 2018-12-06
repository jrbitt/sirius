extends Node2D

onready var player_scene = preload("res://addons/turns/Player.tscn")

var index = 0
var perso = 0

func _change_color():
	var p1 = 1 + (4*index)
	var p2 = 3 + (4*index)
	var p3 = 0 + (4*index)
	var p4 = 2 + (4*index)
	$p2.frame = p1
	$p4.frame = p2
	$p1.frame = p3
	$p3.frame = p4

func _on_left_pressed():
	index = index - 1
	if index < 0:
		index = 7
	_change_color()


func _on_right_pressed():
	index = index + 1
	if index > 7:
		index = 0
	_change_color()


func _on_btnP1_pressed():
	$p1.modulate = Color(0.212,0.447,1,0.5)
	$p2.modulate = Color(1,1,1,1)
	$p3.modulate = Color(1,1,1,1)
	$p4.modulate = Color(1,1,1,1)
	perso = $p1

func _on_btnP2_pressed():
	$p1.modulate = Color(1,1,1,1)
	$p2.modulate = Color(0.212,0.447,1,0.5)
	$p3.modulate = Color(1,1,1,1)
	$p4.modulate = Color(1,1,1,1)
	perso = $p2

func _on_btnP3_pressed():
	$p1.modulate = Color(1,1,1,1)
	$p2.modulate = Color(1,1,1,1)
	$p3.modulate = Color(0.212,0.447,1,0.5)
	$p4.modulate = Color(1,1,1,1)
	perso = $p3

func _on_btnP4_pressed():
	$p1.modulate = Color(1,1,1,1)
	$p2.modulate = Color(1,1,1,1)
	$p3.modulate = Color(1,1,1,1)
	$p4.modulate = Color(0.212,0.447,1,0.5)
	perso = $p4

func _ready():
	perso = $p1
	
func _on_next_pressed():
	var p = player_scene.instance()
	p.color = index
	p.index_avatar = perso.frame
	p._set_avatar(perso.texture)
	var pls = GlobalGames.get_node("players")
	pls.add_child(p)
	print(GlobalGames.get_node("players").get_child_count())
	get_tree().change_scene("res://games/common/DefineName.tscn")
	
	
