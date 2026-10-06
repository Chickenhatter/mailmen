extends Node2D
var inmailbox = false
var puzzle = false
@onready var mailman = $"../../character/mailman"
var mouseinlock = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inmailbox == true:
		if Input.is_action_just_pressed('ui_f'):
			if puzzle == false:
				puzzle = true
				mailman.moving = false
				$"mailbox screen".global_position = mailman.global_position
				$"mailbox screen/deadlock/slider".global_position = $"mailbox screen/deadlock/case/leftest".global_position
			else:
				puzzle = false
				mailman.moving = true
				$"mailbox screen".global_position = Vector2(-1000,-1000)
	if mouseinlock == true:
		if Input.is_action_pressed('ui_leftclick'):
			if (get_global_mouse_position().x > $"mailbox screen/deadlock/case/leftest".global_position.x) and (get_global_mouse_position().x < $"mailbox screen/deadlock/case/rightest".global_position.x):
				$"mailbox screen/deadlock/slider".global_position.x = get_global_mouse_position().x
			elif (get_global_mouse_position().x < $"mailbox screen/deadlock/case/leftest".global_position.x):
				$"mailbox screen/deadlock/slider".global_position.x = $"mailbox screen/deadlock/case/leftest".global_position.x
			else:
				$"mailbox screen/deadlock/slider".global_position.x = $"mailbox screen/deadlock/case/rightest".global_position.x
		


func _on_dlmailboxarea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = true


func _on_dlmailboxarea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = false


func _on_rigid_body_2d_mouse_entered() -> void:
	mouseinlock = true


func _on_rigid_body_2d_mouse_exited() -> void:
	mouseinlock = false


func _on_dlactivator_body_entered(body: Node2D) -> void:
	if body.name == 'slider':
		pass
