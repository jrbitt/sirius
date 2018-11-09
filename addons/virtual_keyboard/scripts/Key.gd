extends Control

export(String) var tecla = "A"
export(Texture) var botao_normal setget _set_textura

signal botao_pressionado(t)

func _set_textura(t):
	botao_normal = t
	$botao.texture_normal = botao_normal
	
func _ready():
	$botao.texture_normal = botao_normal

func _on_botao_button_up():
	emit_signal("botao_pressionado",tecla)
