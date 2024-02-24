class_name EnemyAI extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health_points: int
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

func get_damage(damage):
	health_points -= damage
	if health_points <= 0:
		for enemy in enemies:
			enemy.enemies.erase($".")
			if enemy.objective == $".":
				enemy.objective = null
		
		for teammates in team_array:
			teammates.team_array.pop_at(teammates.team_array.find($"."))
			print(teammates.team_array)
		
		if team == true:
			Duel_Manager.Team1.pop_at(Duel_Manager.Team1.find($"."))
		else:
			Duel_Manager.Team2.pop_at(Duel_Manager.Team2.find($"."))
		
		queue_free()
