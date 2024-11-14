extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func get_pos() -> Vector3:

	var player = get_parent().get_node("Player")
	if player:
		return player.global_transform.origin
	var pos:Vector3
	return pos

func _physics_process(delta: float) -> void:

	var player_cur_pos = get_pos()
	velocity.x = move_toward(velocity.x, player_cur_pos.x, SPEED)
	velocity.z = move_toward(velocity.z, player_cur_pos.z, SPEED)
	move_and_slide()
