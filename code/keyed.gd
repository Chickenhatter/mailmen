extends Node2D
var inpot = false
var holdingkey = false
@onready var character = %mailman
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inpot == true:
		if Input.is_action_just_pressed('ui_f'):
			if holdingkey == true:
				holdingkey = false
				$key/key.play('none')
				$key.global_position = character.global_position
			else:
				$key/key.play('key')
				holdingkey = true

func _on_keyarea_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		inpot = true


func _on_keyarea_body_exited(body: Node2D) -> void:
	if body.name == "mailman":
		inpot = false
