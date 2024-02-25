extends Node
# deck inicial de cada uno de los jugadores
@export var deckJ1 = []
@export var deckJ2 = []
#sprites de cada una de las cartas
var spritesCards = [
	"res://Sprites/Cards/cartaPulpo_FINAL.png",
	"res://Sprites/Cards/cartaTiburon_FINAL.png",
	"res://Sprites/Cards/cartaRape_FINAL.png",
	"res://Sprites/Cards/cartaEel_FINAL.png",
	"res://Sprites/Cards/cartaRaya_FINAL.png"
]

# cartas seleccionadas para combate de los jugadores
var selectedCardsJ1 = []
var selectedCardsJ2 = []

@onready var cursorP1 = $"../Cursor_J1"
@onready var cursorP2 = $"../Cursor_J2"
@onready var RayP1 = $"../Cursor_J1/RayCast2D"
@onready var RayP2 = $"../Cursor_J2/RayCast2D"
@onready var P1_Ready = $"../UI_Cards/P1_Ready"
@onready var P2_Ready = $"../UI_Cards/P2_Ready"
@onready var battle = $"../Battle_Scene"

var P1
var P2

@onready var Team1_Shader = preload("res://Shaders/Team1.gdshader")
@onready var Team2_Shader = preload("res://Shaders/Team2.gdshader")

@onready var SFX_Audio = $"../SFX"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../Sprite2D/AnimationPlayer".play("Animations/DuelBG")
	# desordena las barajas de los jugadores
	deckJ1.shuffle()
	randomize()
	deckJ2.shuffle()
	var dualshocks = Input.get_connected_joypads()	
	
	SFX_Audio.stream = load("res://Audio/SFX/suffling.mp3")
	SFX_Audio.play()
	
	var p1_cursorSprite = cursorP1.get_child(1)
	p1_cursorSprite.material = ShaderMaterial.new()
	p1_cursorSprite.material.shader = Team1_Shader
	
	var p2_cursorSprite = cursorP2.get_child(1)
	p2_cursorSprite.material = ShaderMaterial.new()
	p2_cursorSprite.material.shader = Team2_Shader
	
	if dualshocks.size() == 2:
		P1 = dualshocks[0]
		P2 = dualshocks[1]
	else:
		show_errorJoys()
	
	_ChangeCardSprite()

func show_errorJoys():
	$"../UI_Cards/Label".visible = true
	await get_tree().create_timer(3.5).timeout
	get_tree().change_scene_to_file("res://Scenes/main_manu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_cursor_limits()
	
	if selectedCardsJ1.size() == 3:
		cursorP1.visible = false
		P1_Ready.visible = true
	
	if selectedCardsJ2.size() == 3:
		cursorP2.visible = false
		P2_Ready.visible = true
	
	if P1_Ready.visible == true && P2_Ready.visible == true && battle.visible == false:
		_HideCards()
		
		var first_card_P1 = find_first(deckJ1, selectedCardsJ1[0])
		deckJ1.pop_at(first_card_P1)
		var second_card_P1 = find_first(deckJ1, selectedCardsJ1[1])
		deckJ1.pop_at(second_card_P1)
		var third_card_P1 = find_first(deckJ1, selectedCardsJ1[2])
		deckJ1.pop_at(third_card_P1)
		
		var first_card_P2 = find_first(deckJ2, selectedCardsJ2[0])
		deckJ2.pop_at(first_card_P2)
		var second_card_P2 = find_first(deckJ2, selectedCardsJ2[1])
		deckJ2.pop_at(second_card_P2)
		var third_card_P2 = find_first(deckJ2, selectedCardsJ2[2])
		deckJ2.pop_at(third_card_P2)
		
		battle.visible = true
		battle.get_child(0).start_duel()

func find_first(Deck : Array, number_to_find : int):
	for element in Deck:
		if element == number_to_find:
			var position = Deck.find(element)
			return position
			break
		
	

func check_cursor_limits():
	#CURSOR 1
	if cursorP1.position.x < 5:
		cursorP1.position.x = 5
	
	if cursorP1.position.x > 1094:
		cursorP1.position.x = 1094
	
	if cursorP1.position.y < 5:
		cursorP1.position.y = 5
	
	if cursorP1.position.y > 650:
		cursorP1.position.y = 650
	
	#CURSOR 2
	if cursorP2.position.x < 5:
		cursorP2.position.x = 5
	
	if cursorP2.position.x > 1094:
		cursorP2.position.x = 1094
	
	if cursorP2.position.y < 5:
		cursorP2.position.y = 5
	
	if cursorP2.position.y > 650:
		cursorP2.position.y = 650

# Cambia la textura a cada una de las cartas de los jugadores
func _ChangeCardSprite():
	$"../0".texture = load(spritesCards[deckJ1[0]])
	$"../1".texture = load(spritesCards[deckJ1[1]])
	$"../2".texture = load(spritesCards[deckJ1[2]])
	if deckJ1.size() > 3:
		$"../3".texture = load(spritesCards[deckJ1[3]])
		$"../4".texture = load(spritesCards[deckJ1[4]])
	else:
		$"../3".visible = false
		$"../4".visible = false
	
	$"../5".texture = load(spritesCards[deckJ2[0]])
	$"../6".texture = load(spritesCards[deckJ2[1]])
	$"../7".texture = load(spritesCards[deckJ2[2]])
	if deckJ2.size() > 3:
		$"../8".texture = load(spritesCards[deckJ2[3]])
		$"../9".texture = load(spritesCards[deckJ2[4]])
	else:
		$"../8".visible = false
		$"../9".visible = false

func _HideCards():
	$"../0".visible = false
	$"../1".visible = false
	$"../2".visible = false
	$"../3".visible = false
	$"../4".visible = false
	$"../5".visible = false
	$"../6".visible = false
	$"../7".visible = false
	$"../8".visible = false
	$"../9".visible = false
	$"../UI_Cards".visible = false
	cursorP1.visible = false
	cursorP2.visible = false
	P1_Ready.visible = false
	P2_Ready.visible = false
	
func _ShowCards():
	SFX_Audio.stream = load("res://Audio/SFX/suffling.mp3")
	SFX_Audio.play()
	battle.visible = false
	selectedCardsJ1.clear()
	selectedCardsJ2.clear()
	$"../0".visible = true
	$"../1".visible = true
	$"../2".visible = true
	if deckJ1.size() > 3:
		$"../3".visible = true
		$"../4".visible = true
	
	$"../5".visible = true
	$"../6".visible = true
	$"../7".visible = true
	if deckJ1.size() > 3:
		$"../8".visible = true
		$"../9".visible = true
	
	$"../UI_Cards".visible = true
	cursorP1.visible = true
	cursorP2.visible = true
	P1_Ready.visible = false
	P2_Ready.visible = false

func _input(event):
	if P1 != null:
		var P1_cursor_move = Vector2(Input.get_joy_axis(P1, JOY_AXIS_LEFT_X), Input.get_joy_axis(P1, JOY_AXIS_LEFT_Y))
		cursorP1.position.x += P1_cursor_move.x * 1.5
		cursorP1.position.y += P1_cursor_move.y * 1.5
		
		
		if Input.is_joy_button_pressed(P1, JOY_BUTTON_A) && selectedCardsJ1.size() <= 2:
			if RayP1.get_collider() != null:
				if RayP1.get_collider().is_in_group("P1"):
					var selected_card = RayP1.get_collider()
					if selected_card.get_parent().visible == true:
						SFX_Audio.stream = load("res://Audio/SFX/choosing_card.mp3")
						SFX_Audio.play()
						var card_num = String(selected_card.get_parent().name)
						selected_card.get_parent().visible = false
						selectedCardsJ1.push_back(deckJ1[int(card_num)])
	
	if P2 != null:
		var P2_cursor_move = Vector2(Input.get_joy_axis(P2, JOY_AXIS_LEFT_X), Input.get_joy_axis(P2, JOY_AXIS_LEFT_Y))
		cursorP2.position.x += P2_cursor_move.x * 1.5
		cursorP2.position.y += P2_cursor_move.y * 1.5
		if Input.is_joy_button_pressed(P2, JOY_BUTTON_A) && selectedCardsJ2.size() <= 2:
			if RayP2.get_collider() != null:
				if RayP2.get_collider().is_in_group("P2"):
					var selected_card = RayP2.get_collider()
					if selected_card.get_parent().visible == true:
						SFX_Audio.stream = load("res://Audio/SFX/choosing_card.mp3")
						SFX_Audio.play()
						var card_num = String(selected_card.get_parent().name)
						selected_card.get_parent().visible = false
						selectedCardsJ2.push_back(deckJ2[int(card_num) - 5])
