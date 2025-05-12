extends CanvasLayer

var gameover = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"得分".text = "得分:"+str(G.score)
	if G.is_dead and not gameover:
		$"满身疮痍".position.y = 591.0
		$"满身疮痍".visible = true
		$"动画".play("满身疮痍")
		gameover = true
		


func _on_重生_pressed() -> void:
	G.is_in_dialog = false
	G.score = 0
	G.is_dead = false
	get_tree().reload_current_scene()
