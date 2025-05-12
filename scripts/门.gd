extends Area2D

@export var 房间 : PackedScene
func _process(delta: float) -> void:
	if $"提示".visible:
		if Input.is_action_just_pressed("Z") and not G.is_in_dialog:
			get_tree().change_scene_to_packed(房间)
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("玩家"):
		$"提示".visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("玩家"):
		$"提示".visible = false
