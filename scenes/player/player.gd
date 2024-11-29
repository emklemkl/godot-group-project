extends CharacterBody3D

var hp = 100
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 3.5
var mouse_sensitivity = 0.002
var object_to_interact_with
var backpack = []

func _ready():
	reset_object_to_interact_with()
	add_to_group("player")
	
func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _calculate_velocity(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed
	
func _physics_process(delta):
	_calculate_velocity(delta)
	
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_just_pressed("use"):
			append_backpack()
			if object_to_interact_with.has_method("interact"):
				object_to_interact_with.interact()
	if Input.is_action_just_pressed("crouch"):
		crouch_down()
	if Input.is_action_just_released("crouch"):
		crouch_up()

func is_item_in_backpack(item):
	return backpack.has(item)

func interact():
	print("Nothing to pick up")

func append_backpack() -> void:
	if object_to_interact_with.has_method("get_item_name"):
		backpack.append(object_to_interact_with.get_item_name())
		print("Backpack: " + str(backpack))
	

func _on_area_3_darm_body_entered(body: Node3D) -> void:
	if body.has_method("interact") && body != $".":
		show_ui_hand()
		object_to_interact_with = body


func _on_area_3_darm_body_exited(body: Node3D) -> void:
	reset_object_to_interact_with()


func reset_object_to_interact_with():
	object_to_interact_with = get_node(".")
	hide_ui_hand()

func crouch_down():
	speed = 3
	$Camera3D.position.y = 0.216
	$CollisionShape3D.get_shape().set_height(0.5)
func crouch_up():
	speed = 5
	$Camera3D.position.y = 0.516
	$CollisionShape3D.get_shape().set_height(1)

func hide_ui_hand():
	$Control/Hand.set_visible(false)
	
func show_ui_hand():
	$Control/Hand.set_visible(true)
