extends Node2D

var  cions = 0
var scor = 0

func playsoundfx(stream):
	$SFX.stream=stream
	$SFX.play()
	


func _process(delta: float) -> void:
	
	$"gui/coins_score".text=str(cions)
	$"gui/myscore".text=str(scor)
