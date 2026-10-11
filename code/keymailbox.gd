extends Node2D
var inmailbox = false
var mailfall = false
var mailstart = false
var transformmail = false
var closemail = false
var cona = 0
var progmail = 0
var puzz = false
@onready var character = %mailman
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inmailbox == true:
		if Input.is_action_pressed('ui_f'):
			if puzz == false:
				character.moving = false
				$"mailbox screen".global_position = character.global_position
				if $"..".holdingkey == true:
					mailaway()
				puzz = true
			else:
				$"mailbox screen".global_position = Vector2(-1000,-1000)
				puzz = false
				character.moving = true
	
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


func _on_generalmailarea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = true


func _on_generalmailarea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inmailbox = false

func mailaway():
	$"mailbox screen".global_position = character.global_position
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
	$"mailbox screen".global_position = Vector2(-1000,-1000)
	$mailboxsprite.global_position = Vector2(-1000,-1000)
	character.moving = true
	$"../..".mailboxcomplete += 1
