extends Node2D

@export var line: Line2D
@export var collider: CollisionShape2D

@export var animation_player: AnimationPlayer
@export var despawn_timer: Timer

func init_line(pos1: Vector2, pos2: Vector2):
	line.set_point_position(0, pos1)
	line.set_point_position(1, pos2)
	collider.shape["a"] = pos1
	collider.shape["b"] = pos2
	
	animation_player.play("fade_in")
	await animation_player.animation_finished
	despawn_timer.start()


func _on_despawn_timer_timeout():
	kill()

func kill():
	queue_free()
