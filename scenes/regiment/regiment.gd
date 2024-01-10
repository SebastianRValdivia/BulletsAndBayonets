extends Node2D

enum regiment_types {
	ARTILLERY,
	CAVALRY,
	INFANTRY,
}
@export var regiment_type: regiment_types

var soldiers_count: int = 80
var soldiers: Array

func _ready():
	
	if regiment_type == regiment_types.INFANTRY:
		var soldier_scene = preload("res://scenes/soldier/soldier.tscn")
		for i in range(soldiers_count):
			var soldier_instance = soldier_scene.instantiate()
			soldier_instance.position = Vector2(i, i)
			add_child(soldier_instance)
	
