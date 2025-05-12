extends Area2D

@export var 生成物 : PackedScene
var over = false
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("玩家") and not over:
		$"动画".play("完毕")
		$"检测".queue_free()
		$"音效".play()
		$"动态".play("顶")
		item()

func item():
	over = true
	var item_node = 生成物.instantiate()
	item_node.position = position - Vector2(0,18*2)
	get_tree().current_scene.add_child(item_node)
