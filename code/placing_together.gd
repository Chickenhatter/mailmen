extends Node2D
var mouseinmailtop = false
var mousestickone = false
var mousesticktwo = false
var mousestickthree = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_leftclick') and mouseinmailtop == true:
		#$Node2D/topmail.linear_velocity = Vector2(0,0)
		$Node2D/topmail.freeze = true
		$Node2D/topmail.global_position = get_global_mouse_position()
		#$Node2D/topmail.set_deferred("global_position", get_global_mouse_position())
		#$Node2D/topmail.linear_velocity = Vector2.ZERO
		#$Node2D/topmail.angular_velocity = 0
	elif $Node2D/topmail.freeze == true:
		print('a')
		PhysicsServer2D.body_set_state(
			$Node2D/topmail.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/topmail.global_transform
		)
		$Node2D/topmail.freeze = false
		$Node2D/topmail.linear_velocity = Vector2(0,1)
	
	if Input.is_action_pressed('ui_leftclick') and mousestickone == true:
		$Node2D/stick1.freeze = true
		$Node2D/stick1.global_position = get_global_mouse_position()
	elif $Node2D/stick1.freeze == true:
		PhysicsServer2D.body_set_state(
			$Node2D/stick1.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			$Node2D/stick1.global_transform
		)
		$Node2D/stick1.freeze = false
		$Node2D/stick1.linear_velocity = Vector2(0,1)
	

func _on_topmail_mouse_entered() -> void:
	mouseinmailtop = true
	


func _on_topmail_mouse_exited() -> void:
	mouseinmailtop = false


func _on_stick_1_mouse_entered() -> void:
	mousestickone = true
	print('test')


func _on_stick_1_mouse_exited() -> void:
	mousestickone = false


func _on_stick_2_mouse_entered() -> void:
	mousesticktwo = true


func _on_stick_2_mouse_exited() -> void:
	mousesticktwo = false


func _on_stick_3_mouse_entered() -> void:
	mousestickthree = true


func _on_stick_3_mouse_exited() -> void:
	mousestickthree = false
