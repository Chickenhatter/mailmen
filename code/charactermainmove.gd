extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var movement = Vector2.ZERO
	if Input.is_action_pressed("ui_w"):
		movement.y -= 1
	if Input.is_action_pressed("ui_s"):
		movement.y += 1
	if Input.is_action_pressed("ui_a"):
		movement.x -= 1
	if Input.is_action_pressed("ui_d"):
		movement.x += 1
	velocity = movement * 100
	move_and_slide()
