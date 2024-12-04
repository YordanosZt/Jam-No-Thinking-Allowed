extends Path2D

@export var obstacle_NORMAL: PackedScene

@onready var path_follow_2d = $PathFollow2D

func spawn():
	path_follow_2d.progress_ratio = randf()
	
	var _obs = obstacle_NORMAL.instantiate()
	_obs.global_position = path_follow_2d.global_position
	add_child(_obs)

func _on_time_between_spawn_timeout():
	spawn()
