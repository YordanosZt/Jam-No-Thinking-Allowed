extends Node2D

@export var stay_time_label: Label
var stay_time: float = 0
@onready var game_over_stay_time_label = $HUD/GameOverPanel/GameOverStayTimeLabel

@onready var game_over_panel = $HUD/GameOverPanel

func _ready():
	Events.game_over.connect(_on_game_over)

func _process(delta):
	stay_time += round(delta * 100)
	stay_time_label.text = str(stay_time / 100)

func _on_game_over():
	game_over_panel.visible = true
	game_over_stay_time_label.text = "Time Survived: " + str(stay_time / 100)
	Engine.time_scale = 0
