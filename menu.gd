extends Control
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frame_indices = [0, 1, 2, 3, 4,5,6,7,8,9]



# Loop para crear e inicializar las instancias


# Called when the node enters the scene tree for the first time.
func _ready():
	var nums = preload("res://nums.tscn")
	var offset = Vector2(90, 0)
	var offset_y = Vector2(0, 450)
	
	for frame_index in range(0, 5):
	# Crea una nueva instancia del AnimatedSprite
		var instance = nums.instance()
	# Establece el frame de animación para esta instancia
		var animated_sprite = instance.find_node("AnimatedSprite")
		animated_sprite.frame = frame_index
		# Cambia el nombre de la instancia
		animated_sprite.name = "numero_"+ str(frame_index)
		# Añade la instancia como hijo del nodo padre
		add_child(instance)
		# Configura la posición de la instancia según sea necesario
		instance.position = Vector2(60,0)+offset * frame_index + offset_y
		instance.orig_pos = instance.position
		instance.numero = frame_index+1
		#instance.connect("addNewSprites",Pizarra,)

	for frame_index in range(5,10):
		var instance = nums.instance()
	# Establece el frame de animación para esta instancia
		var animated_sprite = instance.find_node("AnimatedSprite")
		animated_sprite.frame = frame_index
		# Cambia el nombre de la instancia
		animated_sprite.name = "numero_"+ str(frame_index)
		# Añade la instancia como hijo del nodo padre
		add_child(instance)
		# Configura la posición de la instancia según sea necesario
		instance.position = Vector2(60,0) + offset * (frame_index-5) + offset_y*1.2
		instance.orig_pos = instance.position
		instance.numero = frame_index+1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
