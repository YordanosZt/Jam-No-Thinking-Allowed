extends Path2D

@export var basic: PackedScene
@export var player: Node2D

@onready var path_point = $PathPoint

func spawn():
	path_point.progress_ratio = randf()
	
	var _basic = basic.instantiate()
	_basic.global_position = path_point.global_position
	
	var direction = (path_point.global_position.direction_to(player.global_position)).normalized()
	_basic.add_trajectory(direction)
	
	add_child(_basic)

func _on_timer_timeout():
	spawn()
