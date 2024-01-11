extends Node2D

enum regiment_types {
	ARTILLERY,
	CAVALRY,
	INFANTRY,
}
@export var regiment_type: regiment_types

var soldiers_count: int = 30
var soldiers: Array
var selected: bool = false # If the regiment is selected

func _ready() -> void:
	# Spawn the soldiers in the regiment
	if regiment_type == regiment_types.INFANTRY:
		var soldier_scene = preload("res://scenes/soldier/soldier.tscn")
		for i in range(soldiers_count):
			var soldier_instance = soldier_scene.instantiate()
			soldier_instance.position = Vector2(
				randi_range(
					$RegimentArea/CollisionShape2D.position.x,
					$RegimentArea/CollisionShape2D.shape.size.x
				),
				randi_range(
					$RegimentArea/CollisionShape2D.position.y,
					$RegimentArea/CollisionShape2D.shape.size.y
				)
			)
			soldiers.append(soldier_instance)
			soldier_instance.formation_pos = soldiers.size()
			add_child(soldier_instance)

func _input(event) -> void:
	if event.is_action_pressed("left_click") and selected:
		var target = get_global_mouse_position()
		$RegimentArea.global_position = target
		for soldier in soldiers:
			soldier.march_to(target)

func _on_regiment_area_body_entered(body) -> void:
	if body.is_in_group("soldiers"):
		body.get_in_formation()


func _on_regiment_area_input_event(_viewport, event, _shape_idx) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_pressed("left_click") and selected:
			selected = false
		elif Input.is_action_pressed("left_click") and !selected:
			selected = true
