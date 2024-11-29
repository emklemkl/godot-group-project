extends Node3D

class_name Door

var isOpen = false
var is_unlocked = true
var key_id = ""
var move_degree = 0
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rotation = get_rotation_degrees()
	if(isOpen) && move_degree < 90:
		set_rotation_degrees(Vector3(0,rotation.y+1,0))
		move_degree+=1
	if(!isOpen) && move_degree > 0:
		set_rotation_degrees(Vector3(0,rotation.y-1,0))
		move_degree-=1

func interact():
	var player = get_tree().get_nodes_in_group("player")

	if (!is_unlocked && player[0].is_item_in_backpack(key_id)):
		set_is_unlocked(true)
		
	if (is_unlocked):
		if(isOpen):
			isOpen = false
		else:
			isOpen = true

func get_is_unlocked():
	return is_unlocked
	
func set_is_unlocked(locked: bool = false):
	is_unlocked = locked

func set_key_id(id: String):
	key_id = id
