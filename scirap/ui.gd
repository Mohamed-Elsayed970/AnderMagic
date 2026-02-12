extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://sanse/game.tscn")
	pass # Replace with function body.


func _on_settings_pressed() -> void:
	pass


func _on_exit_pressed() -> void:
	get_tree().quit()
	
