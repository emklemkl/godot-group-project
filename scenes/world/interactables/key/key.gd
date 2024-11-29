extends BasicItem

class_name Key

@export var key_id: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_item_name(key_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
