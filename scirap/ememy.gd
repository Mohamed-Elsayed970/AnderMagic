extends CharacterBody2D
const speed=300
var movingright = 1
var canswitch =true


func _physics_process(delta: float) -> void:
	
	if !$RayCast2D.is_colliding() and canswitch:
		movingright*=-1
		canswitch =false
	else :
		canswitch =true	
	
	
	
	
	if movingright <0:
		velocity.x =speed *-1.0
		$RayCast2D.target_position = Vector2(-270,250)
	else :
		velocity.x =speed *1.0
		$RayCast2D.target_position = Vector2(270,250)
		
	move_and_slide() 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.killplayer()
