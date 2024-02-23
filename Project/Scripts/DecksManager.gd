extends Node
@export var deckJ1 = []
@export var deckJ2 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	deckJ1.shuffle()
	deckJ2.shuffle()
	print(deckJ1)
	print(deckJ2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
