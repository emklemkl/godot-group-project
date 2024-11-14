extends CharacterBody3D

var hp = 100
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 3.5
var mouse_sensitivity = 0.002

var item_to_pick_up
func ready():
	reset_item_to_pick_up()
	
func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	if Input.is_action_just_pressed("interact"):
		interact()

func _physics_process(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed
	
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_just_pressed("use"):
			if item_to_pick_up.has_method("interact"):
				item_to_pick_up.interact()

func interact():
	print("Nothing to pick up")

func _on_area_3_darm_body_entered(body: Node3D) -> void:
	item_to_pick_up = body


func _on_area_3_darm_body_exited(body: Node3D) -> void:
	reset_item_to_pick_up()


func reset_item_to_pick_up():
	item_to_pick_up = get_node(".")
