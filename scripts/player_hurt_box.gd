extends Area2D

@export var max_health: int = 10
var current_health: int

@onready var health_label = $"../PlayerHUD/HealthLabel"
@onready var hit_particles = $"../HitParticles"
@onready var hurt_overlay = $"../PlayerHUD/HurtOverlay"
@onready var hurt_audio = $"../HurtAudio"

func _ready():
	current_health = max_health
	health_label.text = "Health: " + str(current_health)

func take_damage(amount: int = 1):
	current_health -= amount
	health_label.text = "Health: " + str(current_health)
	hit_particles.emitting = true
	Events.camera_shake.emit()
	hurt_audio.play()
	hurt_overlay.visible = true
	await get_tree().create_timer(0.5).timeout
	hurt_overlay.visible = false
	
	if current_health <= 0:
		#get_tree().reload_current_scene()
		Events.game_over.emit()

func _on_area_entered(area):
	take_damage()
	area.kill()
