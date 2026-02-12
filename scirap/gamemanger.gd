extends Node2D

var cions = 0
var scor = 0

<<<<<<< HEAD
func playsoundfx(stream):
	$SFX.stream=stream
	$SFX.play()
	


func _process(delta: float) -> void:
=======
func _start() -> void:
	$gui.visible = true
>>>>>>> 56a5ec1b305775df14b890b1100d86593761a332
	
func _ready() -> void:
	$gui.visible = false

func _process(delta: float) -> void:
	$"gui/coins_score".text = str(cions)
	$"gui/myscore".text = str(scor)
