extends Node2D
@onready var character = %mailman
var inmailbox = true
var itshere = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inmailbox == true and Input.is_action_just_pressed('ui_f'):
		if itshere == true:
			turn(false)
			character.moving = true
			$"placing together".global_position = Vector2(-1000,-1000)
			itshere = false
		else:
			character.moving = false
			$"placing together".global_position = character.global_position
			turn(true)
			itshere = true



func turn(a):
	$"placing together/Node2D/topmail".freeze = a
	$"placing together/Node2D/stick1".freeze = a
	$"placing together/Node2D/stick2".freeze = a
	$"placing together/Node2D/stick3".freeze = a
	$"placing together/Node2D/topmail".freeze = a
