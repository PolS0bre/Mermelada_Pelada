extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = load("res://Sprites/fuckboyycumcum.jpg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_changeTutorial()

func _changeTutorial():
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.texture = load("res://Sprites/fuckboyycumcum.jpg")
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.texture = load("res://Sprites/man.png")