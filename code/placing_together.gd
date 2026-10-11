extends Node2D
var mouseinmailtop = false
var mousestickone = false
var mousesticktwo = false
var mousestickthree = false
var collisioncontrol = 0
var mailattop = false
var lctimer = 0
var startfreeze = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_leftclick') and mouseinmailtop == true and collisioncontrol == 1:
		#$Node2D/topmail.linear_velocity = Vector2(0,0)
		$Node2D/topmail.freeze = true
		$Node2D/topmail.global_position = get_global_mouse_position()
		#$Node2D/topmail.set_deferred("global_position", get_global_mouse_position())
		#$Node2D/topmail.linear_velocity = Vector2.ZERO
		#$Node2D/topmail.angular_velocity = 0
	elif $Node2D/topmail.freeze == true and startfreeze == false:
		print('a')
		PhysicsServer2D.body_set_state(
			$Node2D/topmail.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/topmail.global_transform
		)
		$Node2D/topmail.freeze = false
		$Node2D/topmail.linear_velocity = Vector2(0,1)
	
	if Input.is_action_pressed('ui_leftclick') and mousestickone == true and collisioncontrol == 1:
		$Node2D/stick1.freeze = true
		$Node2D/stick1.global_position = get_global_mouse_position()
	elif $Node2D/stick1.freeze == true and startfreeze == false:
		PhysicsServer2D.body_set_state(
			$Node2D/stick1.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/stick1.global_transform
		)
		$Node2D/stick1.freeze = false
		$Node2D/stick1.linear_velocity = Vector2(0,1)
	
	
	if Input.is_action_pressed('ui_leftclick') and mousesticktwo == true and collisioncontrol == 1:
		$Node2D/stick2.freeze = true
		$Node2D/stick2.global_position = get_global_mouse_position()
	elif $Node2D/stick2.freeze == true and startfreeze == false:
		PhysicsServer2D.body_set_state(
			$Node2D/stick2.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/stick2.global_transform
		)
		$Node2D/stick2.freeze = false
		$Node2D/stick2.linear_velocity = Vector2(0,1)
	
	if Input.is_action_pressed('ui_leftclick') and mousestickthree == true and collisioncontrol == 1:
		$Node2D/stick3.freeze = true
		$Node2D/stick3.global_position = get_global_mouse_position()
	elif $Node2D/stick3.freeze == true and startfreeze == false:
		PhysicsServer2D.body_set_state(
			$Node2D/stick3.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/stick3.global_transform
		)
		$Node2D/stick3.freeze = false
		$Node2D/stick3.linear_velocity = Vector2(0,1)
	
	if Input.is_action_pressed('ui_leftclick'):
		lctimer = 0
	else:
		lctimer += delta
	
	
	if mailattop == true:
		if lctimer > 1.5:
			lctimer = -1000
			mailattop = false
			$".".global_position = Vector2(-1000,-1000)
			%mailbox.mailaway()


func _on_topmail_mouse_entered() -> void:
	mouseinmailtop = true
	collisioncontrol += 1
	


func _on_topmail_mouse_exited() -> void:
	mouseinmailtop = false
	collisioncontrol -= 1


func _on_stick_1_mouse_entered() -> void:
	mousestickone = true
	collisioncontrol += 1


func _on_stick_1_mouse_exited() -> void:
	mousestickone = false
	collisioncontrol -= 1


func _on_stick_2_mouse_entered() -> void:
	mousesticktwo = true
	collisioncontrol += 1


func _on_stick_2_mouse_exited() -> void:
	mousesticktwo = false
	collisioncontrol -= 1


func _on_stick_3_mouse_entered() -> void:
	mousestickthree = true
	collisioncontrol += 1


func _on_stick_3_mouse_exited() -> void:
	mousestickthree = false
	collisioncontrol -= 1


func _on_bush_mouse_entered() -> void:
	collisioncontrol += 1


func _on_bush_mouse_exited() -> void:
	collisioncontrol -= 1


func _on_boxaround_mouse_entered() -> void:
	collisioncontrol += 1


func _on_boxaround_mouse_exited() -> void:
	collisioncontrol -= 1


func _on_detectmailboxin_body_entered(body: Node2D) -> void:
	if body.name == "topmail":
		mailattop = true


func _on_detectmailboxin_body_exited(body: Node2D) -> void:
	if body.name == "topmail":
		mailattop = false
