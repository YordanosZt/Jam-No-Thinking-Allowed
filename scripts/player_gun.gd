extends Marker2D

@export var bullet: PackedScene

var mouse_pos: Vector2
var direction_to_mouse: Vector2
var visual_original_pos: Vector2

var can_shoot_again: bool = true

@onready var firing_point = $FiringPoint
@onready var time_between_fire = $TimeBetweenFire
@onready var visual = $Visual
@onready var gun_shot_audio = $"../GunShotAudio"

func _ready():
	visual_original_pos = visual.position

func _process(delta):
	mouse_pos = get_global_mouse_position()
	direction_to_mouse = global_position.direction_to(mouse_pos)
	
	visual.position.x = move_toward(visual.position.x, visual_original_pos.x, 40 * delta)
	
	# handle rotation
	look_at(global_position + direction_to_mouse)
	
	#handle shooting
	if should_shoot():
		shoot()

func should_shoot() -> bool:
	return Input.is_action_pressed("shoot") and can_shoot_again

func shoot() -> void:
	var _bullet = bullet.instantiate()
	_bullet.global_position = firing_point.global_position
	_bullet.global_rotation = firing_point.global_rotation
	firing_point.add_child(_bullet)
	
	can_shoot_again = false
	time_between_fire.start()
	visual.position.x -= 6.0
	gun_shot_audio.play()

func _on_time_between_fire_timeout():
	can_shoot_again = true
