extends EnemyAI

@export var Name = ""
var team_array = []

func _ready():
	health_points = 150
	attack_points = 20
	range_att = 85.0
	cooldown = 1.5
	special_cooldown = 15.0
	speed = 50
	enemies = get_tree().get_nodes_in_group("Enemy")
	
	for enemy in enemies:
		if enemy.team == team:
			var index = enemies.find(enemy)
			team_array.push_front(index)
	
	for teammates in team_array:
		enemies.remove_at(teammates)

func _physics_process(delta):
	if objective == null:
		_find_objective()
	else:
		if position.distance_to(objective.position) > range_att:
			_follow()
			move_and_slide()
		else:
			if special_cooldown <= 0.0:
				special_attack()
			elif cooldown <= 0.0:
				attack()
	special_cooldown -= delta
	cooldown -= delta

func _find_objective():
	for enemy in enemies:
		if objective == null:
			var index = enemies.find(enemy)
			objective = enemies[index]
		# Comprovar si la distància entre el altre enemic i el jugador és menor que la comporvada amb l'objectiu
		elif position.distance_to(enemy.position) < position.distance_to(objective.position):
			var index = enemies.find(enemy)
			objective = enemies[index]

func _follow():
	velocity = position.direction_to(objective.position) * speed

func special_attack():
	objective.get_damage(attack_points * 3)
	#critico
	if randi_range(0, 100) > 90:
		objective.get_damage(10)
	special_cooldown = 15.0

func attack():
	objective.get_damage(attack_points)
	#critico
	if randi_range(0, 100) > 90:
		objective.get_damage(5)
	cooldown = 1.5
