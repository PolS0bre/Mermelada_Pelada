extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer/Button_ReturnMainMenu.grab_focus()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_return_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_manu.tscn")


func _on_button_exit_pressed():
	get_tree().quit()
