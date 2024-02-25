extends Node2D

var frq = 5
var amplitud = 150
var time = 0

var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	
	var movement = cos(time * frq) * amplitud
	position.x += movement * delta
	position.y -= speed * delta
	
	if position.y < -20:
		queue_free()
