extends Node2D

@export var enemy_types = []

var Team1 = []
var Team2 = []

var score_P1 : int = 0
var score_P2 : int = 0

var in_battle = false

@onready var positions_base = [Vector2(173, 398), Vector2(340, 498), Vector2(402, 276), Vector2(638, 276), Vector2(915, 498), Vector2(730, 398)]
var positions_used = []

@onready var Team1_Shader = preload("res://Shaders/Team1.gdshader")
@onready var Team2_Shader = preload("res://Shaders/Team2.gdshader")

@onready var CardMode_Manager = $"../../Decks Manager"


func start_duel():
	print(positions_base)
	positions_used = positions_base
	for p1_monster in CardMode_Manager.selectedCardsJ1:
		var mob = enemy_types[p1_monster].instantiate()
		
		var position_spawn = randi_range(0, positions_used.size() - 1)
		if position_spawn == -1:
			position_spawn = 0
		mob.position = positions_used[position_spawn]
		mob.team = true
		positions_used.pop_at(position_spawn)
		
		$"..".add_child(mob)
		var mon_sprite = mob.get_child(1)
		mon_sprite.material = ShaderMaterial.new()
		mon_sprite.material.shader = Team1_Shader
		Team1.push_back(mob)
	
	for p2_monster in CardMode_Manager.selectedCardsJ2:
		var mob = enemy_types[p2_monster].instantiate()
		
		var position_spawn = randi_range(0, positions_used.size() - 1)
		if position_spawn == -1:
			position_spawn = 0
		
		mob.position = positions_used[position_spawn]
		mob.team = false
		positions_used.pop_at(position_spawn)
		
		$"..".add_child(mob)
		var mon_sprite = mob.get_child(1)
		mon_sprite.material = ShaderMaterial.new()
		mon_sprite.material.shader = Team2_Shader
		Team2.push_back(mob)
	
	for team1_enemy in Team1:
		team1_enemy._difference_teams()
	
	for team2_enemy in Team2:
		team2_enemy._difference_teams()
	
	in_battle = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_battle:
		if Team1.size() == 0:
			print("Team 2 WINS")
		
			var resta_peces = get_tree().get_nodes_in_group("Enemy")
			for pez in resta_peces:
				pez.queue_free()
		
			Team1.clear()
			Team2.clear()
			
			score_P1 += 1
			
			CardMode_Manager._ChangeCardSprite()
			CardMode_Manager._ShowCards()
			in_battle = false
		
		elif Team2.size() == 0:
			print("Team 1 WINS")
		
			var resta_peces = get_tree().get_nodes_in_group("Enemy")
			for pez in resta_peces:
				pez.queue_free()
		
			Team1.clear()
			Team2.clear()
			
			score_P2 += 1
			
			CardMode_Manager._ChangeCardSprite()
			CardMode_Manager._ShowCards()
			
			in_battle = false
