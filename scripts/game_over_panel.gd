extends Control




func _on_restart_btn_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1


func _on_quit_btn_pressed():
	get_tree().quit()
