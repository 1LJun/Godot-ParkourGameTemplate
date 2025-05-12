extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "你的最终得分是："+ str(G.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
