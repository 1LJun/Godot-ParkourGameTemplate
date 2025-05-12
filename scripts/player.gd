extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0
@export var jump_times = 0
@export var player : bool

func _ready() -> void:
	if not player:
		scale = Vector2(0.75,0.75)
	else:
		add_to_group("玩家")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not G.climb_allow:
		velocity += get_gravity() * delta
	else:
		jump_times = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_times <= 1 and not G.is_in_dialog and not G.is_dead:
		jump_times += 1
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and not G.is_in_dialog and not G.is_dead:
		if direction > 0:
			$"动画".flip_h = true
		if direction < 0:
			$"动画".flip_h = false
		$"动画".play("行走")
		velocity.x = direction * SPEED
	else:
		if not is_on_floor():
			$"动画".play("跳跃")
		else:
			$"动画".play("待机")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
