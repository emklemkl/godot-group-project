extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5


func get_pos() -> Vector3:
	var player = get_parent().get_node("Player")
	if player:
		return player.global_transform.origin
	var pos:Vector3
	return pos

func _physics_process(delta: float) -> void:
	var player_cur_pos = get_pos()
	var troll_cur_pos = self.global_transform.origin
	var direction = (player_cur_pos - troll_cur_pos).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	move_and_slide()
