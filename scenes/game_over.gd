extends Control

@export var level_scene: PackedScene

func _ready():
	$TitleMusic.play()
	$CenterContainer/VBoxContainer/Score.text = "Score: " + str(Global.score)

func _input(event):
	if event.is_action_pressed('fire'):
		get_tree().change_scene_to_packed(level_scene)
