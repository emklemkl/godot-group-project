extends Node3D

var isOpen = false
var close_pos = Vector3()
var open_pos = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_pos = get_global_position()
	open_pos = Vector3(close_pos.x + 0.395, close_pos.y, close_pos.z + 0.414)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	if(isOpen):
		set_rotation_degrees(Vector3(0, 0, 0))
		set_global_position(close_pos)
		isOpen = false
	else:
		set_rotation_degrees(Vector3(0, 90, 0))
		set_global_position(open_pos)
		isOpen = true
