extends CharacterBody2D

var speed = 50  # In pixels/sec
var target_position # Location to move to
var march_to_position: Vector2 = Vector2.ZERO
var in_formation: bool
@export var formation_pos: int

func _physics_process(_delta):
	if not in_formation:
		if global_position.distance_to(march_to_position) > 3:
			target_position = (march_to_position - global_position).normalized()
			velocity = target_position * speed
			move_and_slide()
	else:
		pass

func get_in_formation():
	# Put soldiers in the firing position
	in_formation = true
	

func march_to(location):
	march_to_position = location
