extends Node2D
var inbone = false
var holdingbone = false
var dogtamed = false
@onready var darkplace = $"../../character/mailman/darkspire"
@onready var character = $"../../character/mailman"
var darkening = false

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
			if character.moving == true:
				holdingbone = false
				$bone/bonesprite.play('bone')
				$"../../character/mailman/bonesprite".play('none')
				$bone.global_position = character.global_position
	
	if darkening == true:
		darkplace.self_modulate.a += delta * 1
		if darkplace.self_modulate.a < 0:
			darkplace.self_modulate.a = 0
	else:
		darkplace.self_modulate.a -= delta * 1
		if darkplace.self_modulate.a > 1:
			darkplace.self_modulate.a = 1


func _on_bonearea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inbone = true


func _on_bonearea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inbone = false


func _on_gardenarea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		if dogtamed == false:
			if holdingbone == true:
				dogtamed = true
				holdingbone = false
				tame_dog()
			else:
				dog_pushout()


func tame_dog():
	darkening = true
	await get_tree().create_timer(0.2).timeout
	character.moving = false
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(0.6).timeout
	$"../../character/mailman/bonesprite".play('none')
	await get_tree().create_timer(1).timeout
	darkening = false
	
	dogtamed = true
	await get_tree().create_timer(0.2).timeout
	character.moving = true

func dog_pushout():
	character.moving = false
	await get_tree().create_timer(0.2).timeout
	darkening = true
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(0.3).timeout
	character.global_position = $"dog garden/Node2D/gardenarea/pointtomove".global_position
	$dogbark.play()
	await get_tree().create_timer(0.5).timeout
	darkening = false
	await get_tree().create_timer(1).timeout
	character.moving = true


func _on_rigid_body_2d_mouse_entered() -> void:
	pass # Replace with function body.


func _on_stick_1_mouse_entered() -> void:
	pass # Replace with function body.
