class_name EnemyAI extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health_points: int
var attack_points: int
var range_att: float
var cooldown: float
var special_cooldown: float
@export var team: bool
var speed: float

var enemies = []
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
			var index = enemies.find(enemy)
			enemies.erase($".")
		queue_free()

func get_enemies():
	pass
