extends Node3D

class_name Door

var isOpen = false
var is_unlocked = true
var key_id = ""
var close_pos = Vector3()
var open_pos = Vector3()
# Called when the node enters the scene tree for the first time.

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


	var player = get_tree().get_nodes_in_group("player")

	if (!is_unlocked && player[0].is_item_in_backpack(key_id)):
		set_is_unlocked(true)
		
	if (is_unlocked):
		if(isOpen):
			set_rotation_degrees(Vector3(0, 0, 0))
			set_global_position(close_pos)
			isOpen = false
		else:
			set_rotation_degrees(Vector3(0, 90, 0))
			set_global_position(open_pos)
			isOpen = true

func get_is_unlocked():
	return is_unlocked
	
func set_is_unlocked(locked: bool = false):
	is_unlocked = locked

func set_key_id(id: String):
	key_id = id
