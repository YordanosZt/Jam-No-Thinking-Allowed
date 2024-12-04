extends CharacterBody2D

@export var strafe_speed = 100.0
@export var max_fall_acceleration: float = 200
@export var max_hover_acceleration: float = 100
@export var fall_acceleration: float
@export var hover_acceleration: float

var is_hovering: bool = false

@onready var hover_particles = $HoverParticles

func _physics_process(delta):
	# Add the gravity.
	apply_gravity(delta)
	
	# hover
	handle_hover()
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * strafe_speed
	else:
		velocity.x = move_toward(velocity.x, 0, strafe_speed)

	hover_particles.emitting = is_hovering

	move_and_slide()

func apply_gravity(delta):
	# Falling
	if not is_hovering:
		velocity.y = move_toward(velocity.y, max_fall_acceleration, fall_acceleration * delta)
	# Hovering
	else:
		velocity.y = move_toward(velocity.y, -max_hover_acceleration, hover_acceleration * delta)

func handle_hover():
	is_hovering = Input.is_action_pressed("hover")
