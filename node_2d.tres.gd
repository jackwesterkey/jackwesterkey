extends CharacterBody2D

const SPEED = 160.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_player : AnimationPlayer

func _ready():
	animation_player = $AnimationPlayer

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("ui_left", "ui_right")

	if direction > 0:
		velocity.x = direction * SPEED
		animation_player.play("jam")
	elif direction < 0:
		velocity.x = direction * SPEED
		animation_player.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation_player.play("idle")

	move_and_slide()
