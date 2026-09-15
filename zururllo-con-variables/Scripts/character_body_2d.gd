extends CharacterBody2D
const SPEED = 200
const JUMP_SPEED = -400
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta
	
	if Input.is_action_just_pressed("Salto") and is_on_floor():
		velocity.y = JUMP_SPEED
	if Input.is_action_pressed("izqda"):
		velocity.x = -SPEED
		animated_sprite.flip_h = true
	elif Input.is_action_pressed("der"):
		velocity.x = SPEED
		animated_sprite.flip_h = false
	else:
		velocity.x = 0
	
	if is_on_floor():
		if velocity.x != 0:
			animated_sprite.play("Walk")
		else:
			animated_sprite.play("Iddle")
	else:
		animated_sprite.play("Jump")
	move_and_slide()
