extends Node2D

signal scored

const SPEED: int = 200

var scorer := false

func _process(delta: float) -> void:
	position.x -= SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_score_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		scorer = true
		scored.emit()
