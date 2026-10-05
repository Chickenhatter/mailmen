extends Node2D
var inbone = false
var holdingbone = false
var dogtamed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inbone == true:
		if Input.is_action_just_pressed('ui_f'):
			$bone/bonesprite.play('none')
			$"../../character/mailman/bonesprite".play('bone')
			holdingbone = true
	elif holdingbone == true:
		if Input.is_action_just_pressed('ui_f'):
			holdingbone = false
			$bone/bonesprite.play('bone')
			$"../../character/mailman/bonesprite".play('none')




func _on_bonearea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inbone = true


func _on_bonearea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inbone = false


func _on_gardenarea_body_entered(body: Node2D) -> void:
	if dogtamed == false:
		if holdingbone == true:
			dogtamed = true
			tame_dog()
		else:
			dog_pushout()


func tame_dog():
	$"../../character/mailman".moving = false

func dog_pushout():
	$"../../character/mailman".moving = false
