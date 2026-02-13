extends CharacterBody2D

const SPEED = 600.0
const RUN_MULTIPLIER = 2.0
const JUMP_VELOCITY = -1900.0
const MAGIC_SCENE = preload("res://sanse/magicarea.tscn")

func _physics_process(delta: float) -> void:

	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Run
	var speed_multiplier = 1.0
	if Input.is_action_pressed("run"):
		speed_multiplier = RUN_MULTIPLIER

	# Movement
	var direction := Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * SPEED * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Flip character
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false

	# Animations
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

	move_and_slide()

	# Magic
	if Input.is_action_just_pressed("magic"):
		var newmagic = MAGIC_SCENE.instantiate()

		if $AnimatedSprite2D.flip_h:
			newmagic.direction = -1
		else:
			newmagic.direction = 1

		newmagic.global_position = %magicspawn.global_position
		get_parent().add_child(newmagic)


func killplayer():
	global_position = %respawn.global_position
	velocity = Vector2.ZERO
	$AnimatedSprite2D.flip_h = false





func _on_killzone_body_entered(body: Node2D) -> void:
	if body == self:
		killplayer()
