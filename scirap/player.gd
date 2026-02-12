extends CharacterBody2D


const SPEED = 600.0
const JUMP_VELOCITY = -1900.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var runn=1
	if Input.is_action_pressed("run"):
		runn=2
	else :
		runn=1	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED *runn
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x< 0:
		$AnimatedSprite2D.flip_h =true
	if velocity.x > 0 :
		$AnimatedSprite2D.flip_h = false
		
	if velocity.x!=0:
		$AnimatedSprite2D.play("walk")
	else :
		$AnimatedSprite2D.play("idle")		

	move_and_slide()
func killplayer():
	position =%respawn.position
	$AnimatedSprite2D.flip_h=false

func _on_killzone_body_entered(body: Node2D) -> void:
	killplayer()
