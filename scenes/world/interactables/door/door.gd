extends Node3D

var isOpen = false
var isLocked = false
var key_id = "_"
var close_pos = Vector3()
var open_pos = Vector3()
# Called when the node enters the scene tree for the first time.

class_name Door

func _ready() -> void:
	close_pos = get_global_position()
	open_pos = Vector3(close_pos.x + 0.395, close_pos.y, close_pos.z + 0.414)
	print(close_pos)
	print(open_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	print(close_pos)
	print(open_pos)
	
	if (isLocked):
		if(isOpen):
			set_rotation_degrees(Vector3(0, 0, 0))
			set_global_position(close_pos)
			isOpen = false
		else:
			set_rotation_degrees(Vector3(0, 90, 0))
			set_global_position(open_pos)
			isOpen = true

func getIsLocked():
	return isLocked
	
func setIsLocker(locked: bool = false):
	isLocked = locked
