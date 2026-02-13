extends AnimatedSprite2D

@export var target_level : PackedScene

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_packed(target_level)
