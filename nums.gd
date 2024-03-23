extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal addNewSprites

var is_inside = false
var orig_pos = Vector2(0,0)
var numero = 0
var marco_area = null
#const MainClass = preload("res://Pizarra.gd")## esto para poder llamar a la funcion addnewsprites desde aca

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	if is_inside:
		global_position = get_global_mouse_position()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_area_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		is_inside = true
		print("grabbed")
		self.z_index = 3
		raise()
	if event.is_action_released("left_click"):
		is_inside = false
		global_position = orig_pos
		print("released")
		if marco_area and Globals.level == numero:
			Globals.pizarra.show_estrella()
			Globals.pizarra.addNewSprites()


func _on_area_area_entered(area):
	print(area.name)
	if area.name == "marco":
		marco_area = area

func _on_area_area_exited(area):
	marco_area = null
