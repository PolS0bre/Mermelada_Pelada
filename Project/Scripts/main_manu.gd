extends Node2D


func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer/MarginContainer/VBoxContainer/Button_Play.grab_focus()

func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/cards_scene.tscn")

func _process(delta):
	if Input.is_action_just_pressed("mouse_mode_change"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_button_tutorial_pressed():
	$CanvasLayer/MarginContainer/VBoxContainer.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = true
	$CanvasLayer/Title.visible = false
	$CanvasLayer/Title2.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.texture = load("res://Sprites/Menu/CardMode_Tutorial.png")
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2/Return.grab_focus()

func _on_button_exit_pressed():
	get_tree().quit()


func _on_return_pressed():
	$CanvasLayer/MarginContainer/VBoxContainer.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2.visible = false
	$CanvasLayer/Title.visible = true
	$CanvasLayer/Title2.visible = true
	$CanvasLayer/MarginContainer/VBoxContainer2/tutorial_image/Sprite2D.visible = false
	$CanvasLayer/MarginContainer/VBoxContainer/Button_Play.grab_focus()
