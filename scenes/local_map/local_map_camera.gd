extends Camera2D

func _process(_delta):

	var zoom_speed = Vector2(0.2, 0.2)
	var min_zoom = Vector2(1, 1)
	var max_zoom = Vector2(3, 3)

	if Input.is_action_just_released("zoom_in"):
		zoom = clamp(zoom, min_zoom, max_zoom) + zoom_speed
	elif Input.is_action_just_released("zoom_out"):
		zoom = clamp(zoom, min_zoom, max_zoom) - zoom_speed
