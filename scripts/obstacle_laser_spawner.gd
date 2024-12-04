extends Path2D

@export var laser: PackedScene

@onready var path_point_1 = $PathPoint1
@onready var path_point_2 = $PathPoint2

func spawn():
	path_point_1.progress_ratio = randf()
	path_point_2.progress_ratio = randf()
	
	var _laser = laser.instantiate()
	_laser.global_position = global_position
	_laser.init_line(path_point_1.global_position, path_point_2.global_position)
	add_child(_laser)

func _on_timer_timeout():
	spawn()
