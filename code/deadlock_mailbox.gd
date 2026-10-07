extends Node2D
var inmailbox = false
var puzzle = false
@onready var mailman = $"../../character/mailman"
var mailfall = false
var mouseinlock = false
var cona = 0

var mailstart = false
var transformmail = false
var closemail = false
var progmail = 0
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
				await get_tree().create_timer(0.1).timeout
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
	
	if mailfall == true:
		cona += 1*delta
		if cona > 1:
			cona = 1
		$"mailbox screen/imagry/front".scale.y = sqrt(-cona*cona+1)
		
	if mailstart == true:
		progmail += delta
		if progmail > 1:
			progmail = 0.99999999999
		$"mailbox screen/Path2D/PathFollow2D".progress_ratio = progmail
		
	if transformmail == true:
		$"mailbox screen/Path2D/PathFollow2D/Node2D".scale.x -= delta * 0.8
	
	if closemail == true:
		cona -= 1*delta
		if cona < 0:
			cona = 0
		$"mailbox screen/imagry/front".scale.y = sqrt(-cona*cona+1)


func _on_dlmailboxarea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = true


func _on_dlmailboxarea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = false


func _on_slider_mouse_entered() -> void:
	mouseinlock = true
	print('a')



func _on_slider_mouse_exited() -> void:
	mouseinlock = false


func _on_dlactivator_area_entered(area: Area2D) -> void:
	if area.name == 'slider':
		mailfall = true
		await get_tree().create_timer(1).timeout
		mailstart = true
		await get_tree().create_timer(1.1).timeout
		mailfall = false
		mailstart = false
		transformmail = true
		await get_tree().create_timer(0.2).timeout
		transformmail = false
		await get_tree().create_timer(0.3).timeout
		closemail = true
		await get_tree().create_timer(1).timeout
		closemail = false
		await get_tree().create_timer(0.2).timeout
		puzzle = false
		mailman.moving = true
		$"mailbox screen".global_position = Vector2(-1000,-1000)
		$mailbox/dlmmap.global_position = Vector2(-1000,-1000)
