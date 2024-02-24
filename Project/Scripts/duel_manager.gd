extends Node2D

var enemies = []
var Team1 = []
var Team2 = []

@onready var Team1_Shader = preload("res://Shaders/Team1.gdshader")
@onready var Team2_Shader = preload("res://Shaders/Team2.gdshader")

# Called when the node enters the scene tree for the first time.
func _ready():
	enemies = get_tree().get_nodes_in_group("Enemy")
	
	for monster in enemies:
		if monster.team == true:
			Team1.push_back(monster)
			var mon_sprite = monster.get_child(1)
			mon_sprite.material = ShaderMaterial.new()
			mon_sprite.material.shader = Team1_Shader
		else:
			Team2.push_back(monster)
			var mon_sprite = monster.get_child(1)
			mon_sprite.material = ShaderMaterial.new()
			mon_sprite.material.shader = Team2_Shader


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Team1.size() == 0:
		print("Team 2 WINS")
	elif Team2.size() == 0:
		print("Team 1 WINS")
