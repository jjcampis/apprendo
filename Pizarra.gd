extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var sprite_prefab = preload("res://frutas.tscn")
#const nums = preload("res://nums.gd")
func _ready():
	Globals.pizarra = self
	#nums.new()
	# Conectar la señal del script nums.gd al método `_onMiSignal` en este script
	#nums.connect("addNewSprites", self, "_on_AddNewSprites")
	randomize()
	addNewSprites()
	

func addNewSprites():
	print("entre ",name)
	print("childrens: ",get_children())
	randomize()
	clearSprites()
	if get_child_count() > 1:
		print("habia")
		clearSprites()
	
	for i in Globals.next_level(): #rand_range(0,10):
		# Instanciar el sprite
		var sprite_instance = sprite_prefab.instance()
		var animated_sprite = sprite_instance.find_node("AnimatedSprite")
		animated_sprite.frame = Globals.frutica
		#var spawn_pos = Vector2(rand_range(100,200),0)
		var spawn_pos = Vector2(0,0)
		print(spawn_pos)
		sprite_instance.global_position = spawn_pos
		yield(self.get_tree().create_timer(rand_range(0.5,1.2)),"timeout")
		add_child(sprite_instance)
		#raise()

func clearSprites():
	for child in get_children():
		child.queue_free()

func show_estrella():
	var estrellas = get_node("../Marco/Estrellas")
	var correcto = get_node("../correcto").play(0.0)
	estrellas.visible = true
	estrellas.play("star")
	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Estrellas_animation_finished():
	var estrellas = get_node("../Marco/Estrellas")
	estrellas.visible = false
	
