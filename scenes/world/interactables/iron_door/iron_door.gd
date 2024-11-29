extends Door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_is_unlocked()
	set_key_id("dungeon_key")
