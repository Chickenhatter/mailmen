extends Node2D
var mailboxcomplete = 0
var darken = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../character/mailman/Sprite2D".self_modulate.a = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(mailboxcomplete)
	if darken == true:
		if $"../character/mailman/Sprite2D".self_modulate.a < 0:
			$"../character/mailman/Sprite2D".self_modulate.a = 0
		$"../character/mailman/Sprite2D".self_modulate.a += delta
	else:
		$"../character/mailman/Sprite2D".self_modulate.a -= delta


func _on_leave_body_entered(body: Node2D) -> void:
	if body.name == "mailman":
		if mailboxcomplete >= 6:
			darken = true
			leaving()

func leaving():
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file('res://scenes/start.tscn')
