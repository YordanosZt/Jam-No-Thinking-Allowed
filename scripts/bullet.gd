extends RigidBody2D

@export var bullet_speed: float = 400


func _process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	linear_velocity = direction * bullet_speed


func _on_destroy_timer_timeout():
	queue_free()


func _on_obstacle_detector_area_entered(area):
	area.kill()
	queue_free()
