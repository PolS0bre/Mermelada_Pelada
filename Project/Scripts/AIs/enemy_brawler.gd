extends EnemyAI

func _ready():
	health_points = 135
	max_hp = 135
	attack_points = 16
	range_att = 75.0
	cooldown = 1.25
	special_cooldown = 10.0
	speed = 65
	health_bar = $ProgressBar

func _physics_process(delta):
	if objective == null:
		$Sprite2D/AnimationPlayer.play("Animations/raya_idle")
		_find_objective()
	else:
		if position.distance_to(objective.position) > range_att:
			_follow()
			move_and_slide()
		else:
			if special_cooldown <= 0.0:
				$Sprite2D/AnimationPlayer.play("Animations/raya_att")
				special_attack()
			elif cooldown <= 0.0:
				$Sprite2D/AnimationPlayer.play("Animations/raya_att")
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
	objective.get_damage(attack_points * 2)
	
	if objective != null:
		var prev_speed = objective.speed 
		objective.cooldown = prev_speed * 2
	special_cooldown = 10.0

func attack():
	objective.get_damage(attack_points)
	#critico
	if objective != null:
		if randi_range(0, 100) > 90:
			objective.get_damage(attack_points / 2.0)
	cooldown = 1.5
