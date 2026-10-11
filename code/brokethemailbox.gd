extends Node2D
@onready var character = %mailman
var inmailbox = true
var itshere = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print($"placing together/Node2D/bush".global_position) #IDK why, this code if removed stops the game from working
	if inmailbox == true and Input.is_action_just_pressed('ui_f'):
		if itshere == true:
			turn(true)
			await get_tree().create_timer(delta).timeout
			character.moving = true
			
			turn(true)
			$"placing together".global_position = Vector2(-1000,-1000)
			turn(true)
			itshere = false
		else:
			character.moving = false
			turn(true)
			$"placing together".global_position = character.global_position
			itshere = true



func turn(a):
	$"placing together/Node2D/topmail".freeze = a
	$"placing together/Node2D/stick1".freeze = a
	$"placing together/Node2D/stick2".freeze = a
	$"placing together/Node2D/stick3".freeze = a
	$"placing together/Node2D/bush".freeze = a
	$"placing together/Node2D/topmail".sleeping = a
	$"placing together/Node2D/stick1".sleeping = a
	$"placing together/Node2D/stick2".sleeping = a
	$"placing together/Node2D/stick3".sleeping = a
	$"placing together/Node2D/bush".sleeping = a
	$"placing together/Node2D/topmail".linear_velocity = Vector2(0,0)
	
	$"placing together/Node2D/topmail".linear_velocity = Vector2(0,0)
	$"placing together/Node2D/topmail".angular_velocity = 0
	$"placing together/Node2D/topmail".freeze = true 
	$"placing together/Node2D/topmail".sleeping = true 
