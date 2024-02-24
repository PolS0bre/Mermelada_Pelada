extends Node
# deck inicial de cada uno de los jugadores
@export var deckJ1 = []
@export var deckJ2 = []
#sprites de cada una de las cartas
var spritesCards = ["res://Sprites/fotoperfil.jpg", "res://Sprites/fuckboyycumcum.jpg", "res://Sprites/lol osea o my god en plan holy shit.jpg", "res://Sprites/man.png", "res://Sprites/merengue.jpg"]
# cartas seleccionadas para combate de los jugadores
var selectedCardsJ1 = []
var selectedCardsJ2 = []

@onready var cursorP1 = $"../Cursor_J1"
@onready var cursorP2 = $"../Cursor_J2"

var P1
var P2



# Called when the node enters the scene tree for the first time.
func _ready():
	# desordena las barajas de los jugadores
	deckJ1.shuffle()
	deckJ2.shuffle()
	print(deckJ1)
	print(deckJ2)
	var dualshocks = Input.get_connected_joypads()
	print(dualshocks)
	if dualshocks.size() == 1:
		print("One Player")
		P1 = dualshocks[0]
	elif dualshocks.size() == 2:
		print("Two Players")
		P1 = dualshocks[0]
		P2 = dualshocks[1]
	_ChangeCardSprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
# Cambia la textura a cada una de las cartas de los jugadores
func _ChangeCardSprite():
	$"../J1Card1".texture = load(spritesCards[deckJ1[0]])
	$"../J1Card2".texture = load(spritesCards[deckJ1[1]])
	$"../J1Card3".texture = load(spritesCards[deckJ1[2]])
	$"../J1Card4".texture = load(spritesCards[deckJ1[3]])
	$"../J1Card5".texture = load(spritesCards[deckJ1[4]])
	$"../J2Card1".texture = load(spritesCards[deckJ1[0]])
	$"../J2Card2".texture = load(spritesCards[deckJ1[1]])
	$"../J2Card3".texture = load(spritesCards[deckJ1[2]])
	$"../J2Card4".texture = load(spritesCards[deckJ1[3]])
	$"../J2Card5".texture = load(spritesCards[deckJ1[4]])

func _HideCards():
	$"../J1Card1".visible = false
	$"../J1Card2".visible = false
	$"../J1Card3".visible = false
	$"../J1Card4".visible = false
	$"../J1Card5".visible = false
	$"../J2Card1".visible = false
	$"../J2Card2".visible = false
	$"../J2Card3".visible = false
	$"../J2Card4".visible = false
	$"../J2Card5".visible = false
	
func _ShowCards():
	$"../J1Card1".visible = true
	$"../J1Card2".visible = true
	$"../J1Card3".visible = true
	$"../J1Card4".visible = true
	$"../J1Card5".visible = true
	$"../J2Card1".visible = true
	$"../J2Card2".visible = true
	$"../J2Card3".visible = true
	$"../J2Card4".visible = true
	$"../J2Card5".visible = true

func _input(event):
	var P1_cursor_move = Vector2(Input.get_joy_axis(P1, JOY_AXIS_LEFT_X), Input.get_joy_axis(P1, JOY_AXIS_LEFT_Y))
	var P2_cursor_move = Vector2(Input.get_joy_axis(P2, JOY_AXIS_LEFT_X), Input.get_joy_axis(P2, JOY_AXIS_LEFT_Y))
	
	cursorP1.position.x += P1_cursor_move.x * 1.5
	cursorP1.position.y += P1_cursor_move.y * 1.5
	
	cursorP2.position.x += P2_cursor_move.x * 1.5
	cursorP2.position.y += P2_cursor_move.y * 1.5

func _clickCard():
	
	# if clicado:
	# get carta onj
	#guardar en array monstruos jugador to fight
	# eliminar de array deck jugador
	#desactivar visibilidad carta clicada
	pass


