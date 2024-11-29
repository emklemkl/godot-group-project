extends Node3D

class_name BasicItem

var item_name: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	queue_free()

func get_item_name():
	return item_name
	
func set_item_name(new_name: String):
	item_name = new_name
