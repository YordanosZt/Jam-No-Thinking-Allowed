extends Camera2D

@export var max_shake_strength: float = 5.0
@export var shake_fade: float = 5.0

var current_shake_strength: float

func _ready():
	Events.camera_shake.connect(_on_camera_shake)

func _process(delta):
	if current_shake_strength > 0:
		current_shake_strength = lerpf(current_shake_strength, 0, shake_fade * delta)

	offset = randomOffset()

func _on_camera_shake():
	apply_shake()

func apply_shake():
	current_shake_strength = max_shake_strength

func randomOffset() -> Vector2:
	return Vector2(randf_range(-current_shake_strength, current_shake_strength), randf_range(-current_shake_strength, current_shake_strength))
