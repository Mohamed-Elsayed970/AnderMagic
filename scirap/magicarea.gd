extends Area2D

var speed = 1500
var direction = 1

func _ready() -> void:
	GameM.playsoundfx(preload("res://New folder/sounds/Retro Magic Protection 01.wav"))

	$Timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float) -> void:

	if direction == 1:
		position.x += speed * delta
		$magic/CPUParticles2D.gravity.x = -3000
	else:
		position.x -= speed * delta
		$magic/CPUParticles2D.gravity.x = 3000


func _on_timer_timeout():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		GameM.scor+= 1000
		area.get_parent().queue_free()
		queue_free()

	
