extends Node


var score = 0
@onready var score_label: Label = $ScoreLabel
@onready var timer: Timer = $Timer


func add_point():
	score += 1
	score_label.text = "you collected " + str(score) + " coins"

	
func end_game():
	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_last_coin_collected() -> void:
	end_game()
