extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func get_pos():
	var player = get_parent().get_node("Player")
	if player:
		print(player.global_transform.origin.y)
	else:
		print("Player node not found")

func _physics_process(delta: float) -> void:

	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.z = move_toward(velocity.z, 0.999929, SPEED)
	get_pos()
	move_and_slide()
