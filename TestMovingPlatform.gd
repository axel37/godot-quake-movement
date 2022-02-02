# A simple platform that follows a path.

extends Spatial

onready var pathFollow: PathFollow = $Path/PathFollow

var speed: float = 0.25
var direction: float = 1 # 1 or -1, used to know which way the platform should be moving

func _physics_process(delta: float) -> void:
	pathFollow.unit_offset += speed * delta * direction # Move up the path
	
	# If we've hit the end of the path, reverse direction
	if pathFollow.unit_offset >= 1 or pathFollow.unit_offset <= 0:
		direction *= -1
