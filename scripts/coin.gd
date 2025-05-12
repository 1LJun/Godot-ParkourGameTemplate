extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("玩家"):
		G.score += 100
		$"音效".play()
		$"碰撞体".queue_free()
		visible = false


func _on_音效_finished() -> void:
	queue_free()
