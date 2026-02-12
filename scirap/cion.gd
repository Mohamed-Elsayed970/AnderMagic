extends AnimatedSprite2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameM.cions+=1
		GameM.scor+= 100
		queue_free()
		print(GameM.cions)
