extends CharacterBody2D

var speed = 50  # In pixels/sec

var march_to_position: Vector2 = Vector2.ZERO
var in_formation: bool
@export var formation_pos: int

func move_to(map_location):
	var target_position # Location to move to
	target_position = (map_location - global_position).normalized()
	velocity = target_position * speed
	move_and_slide()
	
func _physics_process(_delta):
	if not in_formation:
		if global_position.distance_to(march_to_position) > 3:
			move_to(march_to_position)
		else:
			get_in_formation()
	else:
		velocity = Vector2.ZERO

func get_in_formation():
	# Put soldiers in the firing position
	global_position = Vector2(
		global_position.x + formation_pos * 2, 
		global_position.y
	)
	in_formation = true

func march_to(location):
	march_to_position = location
