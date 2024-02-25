class_name EnemyAI extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health_points: int
var max_hp: int
var attack_points: int
var range_att: float
var cooldown: float
var special_cooldown: float
@export var team: bool
@export var Name = ""
var speed: float
@onready var Duel_Manager = $"../Duel_Manager"

var enemies = []
var team_array = []
var team_enemies_pos = []
var objective

@onready var SFX_Audio = $"../../SFX"
var health_bar

var bubble_obj

func _physics_process(delta):
	pass

func _find_objective():
	pass

func _follow():
	pass

func attack():
	pass

func special_attack():
	pass

func get_damage(damage : float):
	health_points -= damage
	health_bar.value = health_points
	if health_points <= 0:
		for enemy in enemies:
			enemy.enemies.pop_at(enemy.enemies.find($"."))
			if enemy.objective == $".":
				enemy.objective = null
		
		for teammates in team_array:
			teammates.team_array.pop_at(teammates.team_array.find($"."))
		
		if team == true:
			Duel_Manager.Team1.pop_at(Duel_Manager.Team1.find($"."))
		else:
			Duel_Manager.Team2.pop_at(Duel_Manager.Team2.find($"."))
		
		
		SFX_Audio.stream = load("res://Audio/SFX/Pop_Bubble_Sound_Effect_2022.mp3")
		SFX_Audio.play()
		
		#bubble_obj
		var bubble = bubble_obj.instantiate()
		$"..".add_child(bubble)
		bubble.position = position
		
		queue_free()

func _difference_teams():
	enemies = get_tree().get_nodes_in_group("Enemy")
	for enemy in enemies:
		if enemy.team == team:
			var index = enemies.find(enemy)
			team_enemies_pos.push_front(index)
			team_array.push_back(enemy)
	
	for teammates in team_enemies_pos:
		enemies.remove_at(teammates)
	
	team_array.erase($".")

func check_orientation():
	if objective != null:
		if objective.position.x < position.x:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
