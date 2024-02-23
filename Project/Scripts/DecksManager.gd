extends Node
@export var deckJ1 = []
@export var deckJ2 = []
var spritesCards = ["res://Sprites/fotoperfil.jpg", "res://Sprites/fuckboyycumcum.jpg", "res://Sprites/lol osea o my god en plan holy shit.jpg", "res://Sprites/man.png", "res://Sprites/merengue.jpg"]


# Called when the node enters the scene tree for the first time.
func _ready():
	deckJ1.shuffle()
	deckJ2.shuffle()
	print(deckJ1)
	print(deckJ2)
	_ShowCards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _ShowCards():
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
	

func _input(event):
	print(event.as_text())
	
func _clickCard():
	
	# if clicado:
	# get carta onj
	#guardar en array monstruos jugador to fight
	# eliminar de array deck jugador
	#desactivar visibilidad carta clicada
