extends Area2D

var direction

func add_trajectory(dxn):
	direction = dxn

func _process(delta):
	global_position += direction * 100 * delta


func _on_despawn_timer_timeout():
	kill()

func kill():
	queue_free()
