extends CharacterBody3D


@export var SPEED = 5.0

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var input_vertical := Input.get_axis("down", "up")
	var input_rot := Input.get_axis("rot_left", "rot_right")
	var direction := (transform.basis * Vector3(input_dir.x, input_vertical, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
