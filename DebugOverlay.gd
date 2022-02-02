# This is used to draw vectors in 3D space.
# Taken from : https://kidscancode.org/godot_recipes/3d/debug_overlay/

extends CanvasLayer

onready var draw = $DebugDraw3D

# Enter on numpad toggles visibility

func _ready():
	if not InputMap.has_action("toggle_debug"):
		InputMap.add_action("toggle_debug")
		var ev = InputEventKey.new()
		ev.scancode = KEY_KP_ENTER
		InputMap.action_add_event("toggle_debug", ev)

func _input(event):
	if event.is_action_pressed("toggle_debug"):
		for n in get_children():
			n.visible = not n.visible
