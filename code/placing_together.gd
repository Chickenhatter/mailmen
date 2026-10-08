extends Node2D
var mouseinmailtop = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_leftclick') and mouseinmailtop == true:
		$Node2D/topmail.linear_velocity = Vector2(0,0)
		#$Node2D/topmail.freeze = true
		$Node2D/topmail.set_deferred("global_position", get_global_mouse_position())
		$Node2D/topmail.linear_velocity = Vector2.ZERO
		$Node2D/topmail.angular_velocity = 0
	else:
		pass
		#$Node2D/topmail.freeze = false

func _on_topmail_mouse_entered() -> void:
	mouseinmailtop = true
	


func _on_topmail_mouse_exited() -> void:
	mouseinmailtop = false
	print('test')
