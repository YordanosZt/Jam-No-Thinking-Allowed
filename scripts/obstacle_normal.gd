extends Area2D

@onready var player = get_node("/root/Game/Player")
@onready var explosion = $Explosion
@onready var animation_player = $AnimationPlayer

@export var move_speed: float = 0.5

func _process(delta):
	var direction = global_position.direction_to(player.global_position)
	global_position += direction.normalized() * move_speed

func kill():
	animation_player.play("kill")
	Events.camera_shake.emit()

func destroy_self():
	queue_free()
