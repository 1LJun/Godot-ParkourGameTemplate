extends Camera2D

var over = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if G.is_dead and not over :
		$"../../动画".play("死亡")
		over = true
