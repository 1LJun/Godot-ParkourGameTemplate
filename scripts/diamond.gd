extends Area2D

var onFloor = false
var collected = false

func _physics_process(delta: float) -> void:
	if onFloor == false:
		position.y += 36 * delta

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("玩家") and not collected:
		collected = true
		G.score += 1000
		$"音效".play()
		$"碰撞体".queue_free()
		visible = false
	else:
		onFloor = true


func _on_音效_finished() -> void:
	queue_free()
