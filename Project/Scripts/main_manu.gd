extends Node2D


func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer/Button_Play._grabFocus()
	pass

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/cards_scene.tscn")


func _on_button_tutorial_pressed():
	$CanvasLayer/MarginContainer/VBoxContainer.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.texture = load("res://Sprites/fuckboyycumcum.jpg")
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2/Return._grabFocus()

func _on_button_exit_pressed():
	get_tree().quit()


func _on_return_pressed():
	$CanvasLayer/MarginContainer/VBoxContainer.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer/Button_Play._grabFocus()
