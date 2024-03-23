extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level
var frutica
var pizarra
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next_level():
	level = round(rand_range(1,10))
	frutica = round(rand_range(0,8))
	print(level)
	return level
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
