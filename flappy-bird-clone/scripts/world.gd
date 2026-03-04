extends Node2D

@export var pipe_scene: PackedScene 
@export var hud: PackedScene

var score := 0

func _ready():
	new_game()

func new_game():
	score = 0
	update_score()
	$Bird.position = $StartPos.position
	$Floor.position = $FloorPos.position

func spawn_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = 1100
	pipe.position.y = randf_range(-150, 150)
	pipe.scored.connect(on_pip_score)
	$PipeContainer.add_child(pipe)

func _on_timer_timeout() -> void:
	spawn_pipes()

func update_score():
	$Hud/HBoxContainer/VBoxContainer/Score.text = str(score)  

func add_score():
	score += 1
	update_score()

func on_pip_score():
	add_score()
