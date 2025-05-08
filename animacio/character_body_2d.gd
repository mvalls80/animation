extends CharacterBody2D


var alpha := 1.0
var fading_out := true

@export var rotation_speed := 90.0 
@export var move_speed := 100.0

var animating := false

func _physics_process(delta):
	if animating:
		animate(delta)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		animating = true

func animate(delta):
   
	rotation += deg_to_rad(rotation_speed) * delta
	
	velocity.x = move_speed
	move_and_slide()
	
   
	if fading_out:
		alpha -= delta
		if alpha <= 0.3:
			fading_out = false
	else:
		alpha += delta
		if alpha >= 1.0:
			fading_out = true

	modulate.a = clamp(alpha, 0.0, 1.0)
