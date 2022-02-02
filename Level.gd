# Manage mouse capture mode, and draw some debug info on HUD
# I know, this is probably not the best place to put all this :D

extends Node

# Capturing and releasing the mosue
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("attack1") and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().set_input_as_handled()

# Debug statistics
func _process(delta: float) -> void:
	#$HUD/Label.text = "Velocity : %s" % [$Player.velocity]
	$HUD/Label.text = "On floor : %s \nOn wall : %s \nOn ceiling : %s \n\nVelocity : %s \nMax Velocity : %s percent" % ["Yes" if $Player.is_on_floor() else "No", 
	"Yes" if $Player.is_on_wall() else "No", 
	"Yes" if $Player.is_on_ceiling() else "No",
	$Player.debug_horizontal_velocity.length(),
	round($Player.debug_horizontal_velocity.length() / $Player.max_speed * 100)]
