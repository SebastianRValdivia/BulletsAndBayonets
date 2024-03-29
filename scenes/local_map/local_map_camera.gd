extends Camera2D

var _target_zoom: float = 1.0
const MIN_ZOOM = 1.0
const MAX_ZOOM = 3.0
const ZOOM_INCREMENT = 0.1
const ZOOM_RATE: float = 8.0

func _physics_process(delta: float) -> void:
	zoom = lerp(
		zoom,
		_target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
	)
	set_physics_process(
		is_equal_approx(zoom.x, _target_zoom)
	)

func zoom_in() -> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)

func zoom_out() -> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_MIDDLE:
			position -= event.relative * zoom 
	if event is InputEventMouseButton:
		if Input.is_action_pressed("zoom_in"):
			zoom_in()
		if Input.is_action_pressed("zoom_out"):
			zoom_out()

